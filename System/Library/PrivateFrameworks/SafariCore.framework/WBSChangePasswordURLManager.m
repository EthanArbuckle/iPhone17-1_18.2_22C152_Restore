@interface WBSChangePasswordURLManager
- (NSDictionary)changePasswordURLStrings;
- (WBSChangePasswordURLManager)init;
- (WBSChangePasswordURLManager)initWithChangePasswordURLStrings:(id)a3;
- (id)changePasswordURLForHighLevelDomain:(id)a3;
- (void)setChangePasswordURLStrings:(id)a3;
@end

@implementation WBSChangePasswordURLManager

- (WBSChangePasswordURLManager)init
{
  return 0;
}

- (WBSChangePasswordURLManager)initWithChangePasswordURLStrings:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSChangePasswordURLManager;
  v5 = [(WBSChangePasswordURLManager *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    changePasswordURLStrings = v5->_changePasswordURLStrings;
    v5->_changePasswordURLStrings = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)changePasswordURLForHighLevelDomain:(id)a3
{
  v3 = [(NSDictionary *)self->_changePasswordURLStrings objectForKeyedSubscript:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSDictionary)changePasswordURLStrings
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChangePasswordURLStrings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end