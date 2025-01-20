@interface PTDrillDownRow
+ (BOOL)supportsSecureCoding;
+ (id)rowWithTitle:(id)a3 childSettingsKeyPath:(id)a4;
+ (id)rowWithTitleKeyPath:(id)a3 childSettingsKeyPath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)childKeyPath;
- (PTDrillDownRow)initWithChildKeyPath:(id)a3;
- (PTDrillDownRow)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)value;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSettings:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
@end

@implementation PTDrillDownRow

+ (id)rowWithTitle:(id)a3 childSettingsKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithChildKeyPath:v6];

  [v8 setStaticTitle:v7];
  return v8;
}

+ (id)rowWithTitleKeyPath:(id)a3 childSettingsKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithChildKeyPath:v6];

  [v8 setTitleKeyPath:v7];
  return v8;
}

- (PTDrillDownRow)initWithChildKeyPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTDrillDownRow;
  id v6 = [(PTRow *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_childKeyPath, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(PTSettings *)self->_childSettings removeKeyPathObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PTDrillDownRow;
  [(PTRow *)&v3 dealloc];
}

- (void)setSettings:(id)a3
{
  childSettings = self->_childSettings;
  id v5 = a3;
  [(PTSettings *)childSettings removeKeyPathObserver:self];
  id v6 = self->_childSettings;
  self->_childSettings = 0;

  v10.receiver = self;
  v10.super_class = (Class)PTDrillDownRow;
  [(PTRow *)&v10 setSettings:v5];

  if (self->_childKeyPath)
  {
    id v7 = [(PTRow *)self settings];
    v8 = [v7 valueForKeyPath:self->_childKeyPath];
    objc_super v9 = self->_childSettings;
    self->_childSettings = v8;

    [(PTSettings *)self->_childSettings addKeyPathObserver:self];
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6 = (PTSettings *)a3;
  id v7 = a4;
  if (self->_childSettings == v6) {
    [(PTRow *)self _sendValueChanged];
  }
  v8.receiver = self;
  v8.super_class = (Class)PTDrillDownRow;
  [(PTRow *)&v8 settings:v6 changedValueForKeyPath:v7];
}

- (id)value
{
  v8.receiver = self;
  v8.super_class = (Class)PTDrillDownRow;
  objc_super v3 = [(PTRow *)&v8 value];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PTSettings *)self->_childSettings drillDownSummary];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PTDrillDownRow *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTDrillDownRow;
    if ([(PTRow *)&v7 isEqual:v4]) {
      char v5 = BSEqualStrings();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F4F758] builder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __22__PTDrillDownRow_hash__block_invoke;
  v8[3] = &unk_1E63BC570;
  v8[4] = self;
  id v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  id v5 = (id)[v3 appendString:self->_childKeyPath];
  unint64_t v6 = [v3 hash];

  return v6;
}

id __22__PTDrillDownRow_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTDrillDownRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PTDrillDownRow;
  id v4 = [(PTRow *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 19, self->_childKeyPath);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PTDrillDownRow;
  id v4 = a3;
  [(PTRow *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_childKeyPath, @"childKeyPath", v5.receiver, v5.super_class);
}

- (PTDrillDownRow)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTDrillDownRow;
  objc_super v5 = [(PTRow *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childKeyPath"];
    childKeyPath = v5->_childKeyPath;
    v5->_childKeyPath = (NSString *)v6;
  }
  return v5;
}

- (NSString)childKeyPath
{
  return self->_childKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childKeyPath, 0);
  objc_storeStrong((id *)&self->_childSettings, 0);
}

@end