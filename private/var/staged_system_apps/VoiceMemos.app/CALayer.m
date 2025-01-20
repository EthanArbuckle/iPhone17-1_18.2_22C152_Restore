@interface CALayer
- (void)animateProperty:(id)a3 toValue:(id)a4 fromValue:(id)a5 timing:(id)a6;
- (void)animateProperty:(id)a3 toValue:(id)a4 timing:(id)a5;
@end

@implementation CALayer

- (void)animateProperty:(id)a3 toValue:(id)a4 timing:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CALayer *)self valueForKey:v10];
  [(CALayer *)self animateProperty:v10 toValue:v9 fromValue:v11 timing:v8];
}

- (void)animateProperty:(id)a3 toValue:(id)a4 fromValue:(id)a5 timing:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = +[CABasicAnimation animation];
  [v17 setKeyPath:v13];
  [v17 setFromValue:v11];

  [v17 setToValue:v12];
  v14 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v14 recordingControlAnimationDuration];
  [v17 setDuration:];

  v15 = +[CAMediaTimingFunction functionWithName:v10];

  [v17 setTimingFunction:v15];
  v16 = +[NSString stringWithFormat:@"%@Animation", v13];
  [(CALayer *)self addAnimation:v17 forKey:v16];
  [(CALayer *)self setValue:v12 forKey:v13];
}

@end