@interface DKMInterval
+ (NSNumber)negativeInfinityStart;
+ (NSNumber)positiveInfinityEnd;
+ (id)closedClosedIntervalFromStart:(id)a3 toEnd:(id)a4;
+ (id)closedOpenIntervalFromStart:(id)a3 toEnd:(id)a4;
+ (id)intervalForSingleValue:(id)a3;
+ (id)openClosedIntervalFromStart:(id)a3 toEnd:(id)a4;
+ (id)openOpenIntervalFromStart:(id)a3 toEnd:(id)a4;
+ (void)initialize;
- (NSNumber)end;
- (NSNumber)start;
- (NSString)allNumbersIntervalString;
- (NSString)negativeInfinityIntervalString;
- (NSString)positiveInfinityIntervalString;
- (NSString)standardIntervalString;
- (id)description;
- (id)initFromStart:(id)a3 toEnd:(id)a4;
- (id)labelString;
@end

@implementation DKMInterval

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)qword_1002AD6F0;
    qword_1002AD6F0 = (uint64_t)&off_100281740;

    v5 = (void *)qword_1002AD6F8;
    qword_1002AD6F8 = (uint64_t)&off_100281750;
  }
}

+ (NSNumber)negativeInfinityStart
{
  return (NSNumber *)(id)qword_1002AD6F8;
}

+ (NSNumber)positiveInfinityEnd
{
  return (NSNumber *)(id)qword_1002AD6F0;
}

+ (id)openOpenIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(DKMInterval *)[DKMOpenOpenInterval alloc] initFromStart:v6 toEnd:v5];

  return v7;
}

+ (id)openClosedIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(DKMInterval *)[DKMOpenClosedInterval alloc] initFromStart:v6 toEnd:v5];

  return v7;
}

+ (id)closedOpenIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(DKMInterval *)[DKMClosedOpenInterval alloc] initFromStart:v6 toEnd:v5];

  return v7;
}

+ (id)closedClosedIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(DKMInterval *)[DKMClosedClosedInterval alloc] initFromStart:v6 toEnd:v5];

  return v7;
}

+ (id)intervalForSingleValue:(id)a3
{
  return _[a1 closedClosedIntervalFromStart:a3 toEnd:a3];
}

- (id)initFromStart:(id)a3 toEnd:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKMInterval;
  v9 = [(DKMInterval *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSString)standardIntervalString
{
  return 0;
}

- (NSString)negativeInfinityIntervalString
{
  return 0;
}

- (NSString)positiveInfinityIntervalString
{
  return 0;
}

- (NSString)allNumbersIntervalString
{
  return (NSString *)@"All";
}

- (id)labelString
{
  id v3 = [(DKMInterval *)self start];
  v4 = [(DKMInterval *)self end];
  unsigned int v5 = [v3 isEqualToNumber:v4];

  id v6 = [(DKMInterval *)self start];
  id v7 = v6;
  if (v5)
  {
    id v8 = [v6 description];

    goto LABEL_12;
  }
  unsigned int v9 = [v6 isEqualToNumber:qword_1002AD6F8];

  v10 = [(DKMInterval *)self end];
  unsigned int v11 = [v10 isEqualToNumber:qword_1002AD6F0];

  if (v9)
  {
    if (v11)
    {
      id v8 = [(DKMInterval *)self allNumbersIntervalString];
      goto LABEL_12;
    }
    objc_super v12 = [(DKMInterval *)self negativeInfinityIntervalString];
    uint64_t v13 = [(DKMInterval *)self end];
  }
  else
  {
    if (!v11)
    {
      objc_super v12 = [(DKMInterval *)self standardIntervalString];
      v14 = [(DKMInterval *)self start];
      v15 = [(DKMInterval *)self end];
      id v8 = +[NSString stringWithValidatedFormat:v12, @"%@ %@", 0, v14, v15 validFormatSpecifiers error];

      goto LABEL_11;
    }
    objc_super v12 = [(DKMInterval *)self positiveInfinityIntervalString];
    uint64_t v13 = [(DKMInterval *)self start];
  }
  v14 = (void *)v13;
  id v8 = +[NSString stringWithValidatedFormat:v12, @"%@", 0, v13 validFormatSpecifiers error];
LABEL_11:

LABEL_12:

  return v8;
}

- (id)description
{
  return [(DKMInterval *)self labelString];
}

- (NSNumber)start
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)end
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end