@interface TITypologyStatisticTypingSpeed
+ (id)statistic;
+ (id)statisticCompositeWithStatistics:(id)a3;
- (TITypologyStatisticBasicCounts)basicCounts;
- (TITypologyStatisticTimeElapsed)timeElapsed;
- (TITypologyStatisticTypingSpeed)initWithTimeElapsed:(id)a3 basicCounts:(id)a4;
- (float)typingSpeed;
- (id)aggregateReport;
@end

@implementation TITypologyStatisticTypingSpeed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basicCounts, 0);

  objc_storeStrong((id *)&self->_timeElapsed, 0);
}

- (TITypologyStatisticBasicCounts)basicCounts
{
  return self->_basicCounts;
}

- (TITypologyStatisticTimeElapsed)timeElapsed
{
  return self->_timeElapsed;
}

- (id)aggregateReport
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v9.receiver = self;
  v9.super_class = (Class)TITypologyStatisticTypingSpeed;
  v4 = [(TITypologyStatisticComposite *)&v9 aggregateReport];
  v5 = [v3 dictionaryWithDictionary:v4];

  [(TITypologyStatisticTypingSpeed *)self typingSpeed];
  if (v6 > 0.0)
  {
    v7 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v5 setObject:v7 forKey:@"typingSpeed.distr"];
  }

  return v5;
}

- (float)typingSpeed
{
  v3 = [(TITypologyStatisticTypingSpeed *)self timeElapsed];
  [v3 adjustedElapsedTime];
  double v5 = v4;

  float v6 = [(TITypologyStatisticTypingSpeed *)self basicCounts];
  uint64_t v7 = [v6 characterCount];

  float result = 0.0;
  if (v5 > 0.0 && v7 >= 6)
  {
    float v10 = (double)(v7 - 1) / v5;
    return fminf(v10, 18.0);
  }
  return result;
}

- (TITypologyStatisticTypingSpeed)initWithTimeElapsed:(id)a3 basicCounts:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v13[0] = v7;
  v13[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v12.receiver = self;
  v12.super_class = (Class)TITypologyStatisticTypingSpeed;
  float v10 = [(TITypologyStatisticComposite *)&v12 initWithArray:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_timeElapsed, a3);
    objc_storeStrong((id *)&v10->_basicCounts, a4);
  }

  return v10;
}

+ (id)statisticCompositeWithStatistics:(id)a3
{
  return 0;
}

+ (id)statistic
{
  v2 = +[TITypologyStatistic statistic];
  v3 = +[TITypologyStatistic statistic];
  double v4 = [[TITypologyStatisticTypingSpeed alloc] initWithTimeElapsed:v2 basicCounts:v3];

  return v4;
}

@end