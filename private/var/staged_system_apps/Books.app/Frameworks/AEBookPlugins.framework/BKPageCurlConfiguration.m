@interface BKPageCurlConfiguration
- (BKPageCurlConfiguration)initWithContext:(id)a3;
- (IMFrameEnvironment)context;
- (double)heightAllowanceScalar;
- (void)_setupDefault;
- (void)_setupPortraitCompactWidth;
@end

@implementation BKPageCurlConfiguration

- (BKPageCurlConfiguration)initWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKPageCurlConfiguration;
  v5 = [(BKPageCurlConfiguration *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    [(BKPageCurlConfiguration *)v6 _setupPortraitCompactWidth];
    [(BKPageCurlConfiguration *)v6 _setupDefault];
  }

  return v6;
}

- (double)heightAllowanceScalar
{
  v3 = [(BKPageCurlConfiguration *)self context];
  [(BKPageCurlConfiguration *)self floatForKey:@"heightAllowanceScalar" context:v3];
  double v5 = v4;

  return v5;
}

- (void)_setupPortraitCompactWidth
{
  id v3 = +[IMConfigurationPredicate portraitPredicate];
  [(BKPageCurlConfiguration *)self addWithPredicate:v3 adder:&stru_1DC358];
}

- (void)_setupDefault
{
  id v3 = +[IMConfigurationPredicate defaultPredicate];
  [(BKPageCurlConfiguration *)self addWithPredicate:v3 adder:&stru_1DC4B8];
}

- (IMFrameEnvironment)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (IMFrameEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end