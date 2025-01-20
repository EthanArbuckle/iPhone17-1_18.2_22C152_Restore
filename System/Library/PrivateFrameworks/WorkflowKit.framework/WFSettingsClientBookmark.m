@interface WFSettingsClientBookmark
+ (BOOL)supportsSecureCoding;
- (BMBookmark)biomeBookmark;
- (WFSettingsClientBookmark)initWithActionReversalState:(id)a3;
- (WFSettingsClientBookmark)initWithBiomeBookmark:(id)a3;
- (WFSettingsClientBookmark)initWithCoder:(id)a3;
- (id)actionReversalState;
- (void)encodeWithCoder:(id)a3;
- (void)setBiomeBookmark:(id)a3;
@end

@implementation WFSettingsClientBookmark

- (void).cxx_destruct
{
}

- (void)setBiomeBookmark:(id)a3
{
}

- (BMBookmark)biomeBookmark
{
  return self->_biomeBookmark;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSettingsClientBookmark *)self biomeBookmark];
  [v4 encodeObject:v5 forKey:@"biomeBookmark"];
}

- (WFSettingsClientBookmark)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B90];
  id v5 = a3;
  v6 = objc_msgSend(v4, "bm_allowedClassesForSecureCodingBMBookmark");
  v7 = [v5 decodeObjectOfClasses:v6 forKey:@"biomeBookmark"];

  if (v7)
  {
    self = [(WFSettingsClientBookmark *)self initWithBiomeBookmark:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (WFSettingsClientBookmark)initWithBiomeBookmark:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSettingsClientBookmark;
  v6 = [(WFSettingsClientBookmark *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_biomeBookmark, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)actionReversalState
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (WFSettingsClientBookmark)initWithActionReversalState:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFSettingsClientBookmark+WFActionReversalState.m", 17, @"Invalid parameter not satisfying: %@", @"reversalState" object file lineNumber description];

    goto LABEL_5;
  }
  id v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:

    id v7 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:0];
LABEL_6:

  return v8;
}

@end