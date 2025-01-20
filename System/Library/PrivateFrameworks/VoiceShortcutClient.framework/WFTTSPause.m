@interface WFTTSPause
+ (id)parseAnnotationString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)seconds;
- (NSString)description;
- (WFTTSPause)initWithSeconds:(double)a3;
@end

@implementation WFTTSPause

- (void).cxx_destruct
{
}

- (NSNumber)seconds
{
  return self->_seconds;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)WFTTSPause;
  v3 = [(WFTTSPause *)&v7 description];
  v4 = [(WFTTSPause *)self seconds];
  v5 = [v3 stringByAppendingFormat:@": seconds %@", v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(WFTTSPause *)self seconds];
    v6 = [v4 seconds];
    char v7 = [v5 isEqualToNumber:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (WFTTSPause)initWithSeconds:(double)a3
{
  if (a3 == 0.0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFTTSString.m", 132, @"Invalid parameter not satisfying: %@", @"seconds" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFTTSPause;
  v5 = [(WFTTSPause *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [NSNumber numberWithDouble:a3];
    seconds = v5->_seconds;
    v5->_seconds = (NSNumber *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)parseAnnotationString:(id)a3
{
  double v10 = 0.0;
  id v4 = (objc_class *)MEMORY[0x1E4F28FE8];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithString:v5];

  char v7 = 0;
  if ([v6 scanString:@"pauseForSeconds:" intoString:0])
  {
    if ([v6 scanDouble:&v10] && objc_msgSend(v6, "isAtEnd"))
    {
      id v8 = objc_alloc((Class)a1);
      char v7 = (void *)[v8 initWithSeconds:v10];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

@end