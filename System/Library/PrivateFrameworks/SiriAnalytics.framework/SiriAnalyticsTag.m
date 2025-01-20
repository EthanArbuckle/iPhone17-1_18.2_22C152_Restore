@interface SiriAnalyticsTag
+ (BOOL)supportsSecureCoding;
- (SiriAnalyticsTag)init;
- (SiriAnalyticsTag)initWithCoder:(id)a3;
- (SiriAnalyticsTag)initWithConditionType:(int)a3 componentId:(id)a4 componentName:(int)a5 joined:(BOOL)a6;
- (SiriAnalyticsTag)initWithConditionType:(int)a3 end:(unint64_t)a4;
- (SiriAnalyticsTag)initWithConditionType:(int)a3 requestId:(id)a4 joined:(BOOL)a5;
- (SiriAnalyticsTag)initWithConditionType:(int)a3 start:(unint64_t)a4;
- (SiriAnalyticsTag)initWithConditionType:(int)a3 start:(unint64_t)a4 end:(unint64_t)a5;
- (SiriAnalyticsTag)initWithConditionTypeAffectingEntireClock:(int)a3;
- (id)shim;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriAnalyticsTag

- (void).cxx_destruct
{
}

- (SiriAnalyticsTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriAnalyticsTag;
  v5 = [(SiriAnalyticsTag *)&v9 init];
  if (v5)
  {
    v6 = [[SiriAnalyticsTagShim alloc] initWithCoder:v4];
    shim = v5->_shim;
    v5->_shim = v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)shim
{
  return self->_shim;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 requestId:(id)a4 joined:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriAnalyticsTag;
  objc_super v9 = [(SiriAnalyticsTag *)&v13 init];
  if (v9)
  {
    v10 = [[SiriAnalyticsTagShim alloc] initWithConditionType:v6 requestId:v8 joined:v5];
    shim = v9->_shim;
    v9->_shim = v10;
  }
  return v9;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 componentId:(id)a4 componentName:(int)a5 joined:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsTag;
  v11 = [(SiriAnalyticsTag *)&v15 init];
  if (v11)
  {
    v12 = [[SiriAnalyticsTagShim alloc] initWithConditionType:v8 componentId:v10 componentName:v7 joined:v6];
    shim = v11->_shim;
    v11->_shim = v12;
  }
  return v11;
}

- (SiriAnalyticsTag)initWithConditionTypeAffectingEntireClock:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriAnalyticsTag;
  id v4 = [(SiriAnalyticsTag *)&v8 init];
  if (v4)
  {
    BOOL v5 = [[SiriAnalyticsTagShim alloc] initWithConditionTypeAffectingEntireClock:v3];
    shim = v4->_shim;
    v4->_shim = v5;
  }
  return v4;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 end:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriAnalyticsTag;
  BOOL v6 = [(SiriAnalyticsTag *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [[SiriAnalyticsTagShim alloc] initWithConditionType:v5 end:a4];
    shim = v6->_shim;
    v6->_shim = v7;
  }
  return v6;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 start:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriAnalyticsTag;
  BOOL v6 = [(SiriAnalyticsTag *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [[SiriAnalyticsTagShim alloc] initWithConditionType:v5 start:a4];
    shim = v6->_shim;
    v6->_shim = v7;
  }
  return v6;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriAnalyticsTag;
  objc_super v8 = [(SiriAnalyticsTag *)&v12 init];
  if (v8)
  {
    objc_super v9 = [[SiriAnalyticsTagShim alloc] initWithConditionType:v7 start:a4 end:a5];
    shim = v8->_shim;
    v8->_shim = v9;
  }
  return v8;
}

- (SiriAnalyticsTag)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end