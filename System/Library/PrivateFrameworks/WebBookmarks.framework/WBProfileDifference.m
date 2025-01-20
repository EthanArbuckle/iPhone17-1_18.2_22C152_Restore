@interface WBProfileDifference
- (NSSet)settingsKeys;
- (WBProfileDifference)init;
- (WBProfileDifference)initWithResult:(unint64_t)a3 settingsKeys:(id)a4;
- (unint64_t)result;
@end

@implementation WBProfileDifference

- (WBProfileDifference)init
{
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = [(WBProfileDifference *)self initWithResult:0 settingsKeys:v3];

  return v4;
}

- (WBProfileDifference)initWithResult:(unint64_t)a3 settingsKeys:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBProfileDifference;
  v7 = [(WBProfileDifference *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_result = a3;
    uint64_t v9 = [v6 copy];
    settingsKeys = v8->_settingsKeys;
    v8->_settingsKeys = (NSSet *)v9;

    v11 = v8;
  }

  return v8;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSSet)settingsKeys
{
  return self->_settingsKeys;
}

- (void).cxx_destruct
{
}

@end