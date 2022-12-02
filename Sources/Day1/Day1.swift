import Algorithms

public func partOne() {
    let elfCalories = input.caloriesPerElf()
    print( "Part 1: \(elfCalories.max()!)" )
}

public func partTwo() {
    let sortedElfCalories = input.caloriesPerElf().sorted()
    let c = sortedElfCalories.count
    let topThreeElfCalories = sortedElfCalories[c-3..<c].reduce(0,+)
    print( "Part 2: \(topThreeElfCalories)")
}

extension String {
    func caloriesPerElf() -> [Int] {
        var returnValues: [Int] = []
        var currentElfCalories = 0

        for line in self.split(omittingEmptySubsequences: false, whereSeparator: \.isNewline) {
            if let currentLineCalories = Int(line) {
                currentElfCalories += currentLineCalories
            } else {
                returnValues.append(currentElfCalories)
                currentElfCalories = 0
            }
        }

        return returnValues
    }
}
