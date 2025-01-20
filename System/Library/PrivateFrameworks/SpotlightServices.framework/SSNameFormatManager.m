@interface SSNameFormatManager
+ (id)contactFromName:(id)a3;
+ (id)personNameComponentsFromString:(id)a3;
+ (void)initialize;
- (NSPersonNameComponentsFormatter)personNameComponentsFormatter;
- (SSNameFormatManager)init;
- (void)setPersonNameComponentsFormatter:(id)a3;
@end

@implementation SSNameFormatManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sharedNameFormatManager = objc_opt_new();
    MEMORY[0x1F41817F8]();
  }
}

- (SSNameFormatManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSNameFormatManager;
  v2 = [(SSNameFormatManager *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SSNameFormatManager *)v2 setPersonNameComponentsFormatter:v3];
  }
  return v2;
}

+ (id)personNameComponentsFromString:(id)a3
{
  return (id)[MEMORY[0x1E4F5A470] componentsFromString:a3];
}

+ (id)contactFromName:(id)a3
{
  v3 = [a1 personNameComponentsFromString:a3];
  v4 = objc_opt_new();
  [v3 overrideComponentsInContact:v4];
  objc_super v5 = (void *)[v4 copy];

  return v5;
}

- (NSPersonNameComponentsFormatter)personNameComponentsFormatter
{
  return (NSPersonNameComponentsFormatter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersonNameComponentsFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end