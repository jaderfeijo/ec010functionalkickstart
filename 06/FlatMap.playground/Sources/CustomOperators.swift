precedencegroup Evaluate {
    associativity: left
    higherThan: ComparisonPrecedence
}

infix operator |> : Evaluate


public func |> <Input, Output>(x: Input,
                        f: (Input) -> Output) -> Output {
    f(x)
}

precedencegroup Compose {
    associativity: left
    higherThan: Evaluate
}

infix operator >>> : Compose

public func >>> <A, B, C> (f: @escaping (A) -> B,
                           g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}

infix operator <^> : Evaluate

public func <^> <Input, Output>(xs: Array<Input>,
                        f: (Input) -> Output) -> Array<Output> {
    xs.map(f)
}


public func <^> <Input, Output>(xs: Optional<Input>,
                        f: (Input) -> Output) -> Optional<Output> {
    xs.map(f)
}

public func <^> <Input, Output, Failure: Error>(xs: Result<Input, Failure>,
                        f: (Input) -> Output) -> Result<Output, Failure> {
    xs.map(f)
}

infix operator >=> : Evaluate

public func >=> <Input, Output>(xs: Array<Input>,
                        f: (Input) -> Array<Output>) -> Array<Output> {
    xs.flatMap(f)
}

public func >=> <Input, Output>(xs: Optional<Input>,
                        f: (Input) -> Optional<Output>) -> Optional<Output> {
    xs.flatMap(f)
}

public func >=> <Input, Output, Failure>(xs: Result<Input, Failure>,
                        f: (Input) -> Result<Output, Failure>) -> Result<Output, Failure> {
    xs.flatMap(f)
}
