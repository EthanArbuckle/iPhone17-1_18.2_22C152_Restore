@interface PUITextLayoutSet
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)supportedTextLayoutSetForRole:(id)a3;
- (BOOL)allTextLayoutsAreVertical;
- (BOOL)containsTextLayout:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PUITextLayoutSet)initWithBSXPCCoder:(id)a3;
- (PUITextLayoutSet)initWithCoder:(id)a3;
- (PUITextLayoutSet)initWithTextLayout:(unint64_t)a3;
- (PUITextLayoutSet)initWithTextLayouts:(id)a3;
- (PUITextLayoutSet)initWithTextLayoutsIndexSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)textLayoutSetByAddingTextLayout:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)numberOfTextLayouts;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateTextLayouts:(id)a3;
@end

@implementation PUITextLayoutSet

+ (id)supportedTextLayoutSetForRole:(id)a3
{
  int v3 = [a3 isEqual:*MEMORY[0x263F5F458]];
  v4 = [PUITextLayoutSet alloc];
  if (v3) {
    v5 = &unk_27081B518;
  }
  else {
    v5 = &unk_27081B530;
  }
  v6 = [(PUITextLayoutSet *)v4 initWithTextLayouts:v5];
  return v6;
}

- (PUITextLayoutSet)initWithTextLayoutsIndexSet:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__PUITextLayoutSet_initWithTextLayoutsIndexSet___block_invoke;
  v12[3] = &unk_265471550;
  SEL v14 = a2;
  v6 = self;
  v13 = v6;
  [v5 enumerateIndexesUsingBlock:v12];
  v11.receiver = v6;
  v11.super_class = (Class)PUITextLayoutSet;
  v7 = [(PUITextLayoutSet *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v5 mutableCopy];
    titleLayoutSetStorage = v7->_titleLayoutSetStorage;
    v7->_titleLayoutSetStorage = (NSMutableIndexSet *)v8;

    PUITextLayoutSetSharedInit(v7);
  }

  return v7;
}

uint64_t __48__PUITextLayoutSet_initWithTextLayoutsIndexSet___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = PUITextLayoutIsValid(a2);
  if ((result & 1) == 0)
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"PUITextLayout '%lu' is not valid", a2);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __48__PUITextLayoutSet_initWithTextLayoutsIndexSet___block_invoke_cold_1(a1);
    }
    [v5 UTF8String];
    uint64_t result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PUITextLayoutSet)initWithTextLayouts:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUITextLayoutSet;
  v6 = [(PUITextLayoutSet *)&v12 init];
  v7 = v6;
  if (v6)
  {
    PUITextLayoutSetSharedInit(v6);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__PUITextLayoutSet_initWithTextLayouts___block_invoke;
    v9[3] = &unk_265471578;
    SEL v11 = a2;
    v10 = v7;
    [v5 enumerateObjectsUsingBlock:v9];
  }
  return v7;
}

void __40__PUITextLayoutSet_initWithTextLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 unsignedIntValue];
  if (PUITextLayoutIsValid(v3))
  {
    [*(id *)(*(void *)(a1 + 32) + 8) addIndex:v3];
  }
  else
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"PUITextLayout '%lu' is not valid", v3);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __40__PUITextLayoutSet_initWithTextLayouts___block_invoke_cold_1(a1);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (PUITextLayoutSet)initWithTextLayout:(unint64_t)a3
{
  if (PUITextLayoutIsValid(a3))
  {
    v10.receiver = self;
    v10.super_class = (Class)PUITextLayoutSet;
    v6 = [(PUITextLayoutSet *)&v10 init];
    v7 = v6;
    if (v6)
    {
      PUITextLayoutSetSharedInit(v6);
      [(NSMutableIndexSet *)v7->_titleLayoutSetStorage addIndex:a3];
    }
    return v7;
  }
  else
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"PUITextLayout '%lu' is not valid", a3);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUITextLayoutSet initWithTextLayout:](a2);
    }
    [v9 UTF8String];
    uint64_t result = (PUITextLayoutSet *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (unint64_t)hash
{
  return [(NSMutableIndexSet *)self->_titleLayoutSetStorage hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUITextLayoutSet *)a3;
  p_isa = (id *)&v4->super.isa;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [p_isa[1] isEqual:self->_titleLayoutSetStorage];
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

- (void)enumerateTextLayouts:(id)a3
{
}

- (unint64_t)numberOfTextLayouts
{
  return [(NSMutableIndexSet *)self->_titleLayoutSetStorage count];
}

- (BOOL)containsTextLayout:(unint64_t)a3
{
  return [(NSMutableIndexSet *)self->_titleLayoutSetStorage containsIndex:a3];
}

- (id)textLayoutSetByAddingTextLayout:(unint64_t)a3
{
  if ([(PUITextLayoutSet *)self containsTextLayout:"containsTextLayout:"] || !PUITextLayoutIsValid(a3))
  {
    char v6 = self;
  }
  else
  {
    id v5 = (void *)[(NSMutableIndexSet *)self->_titleLayoutSetStorage mutableCopy];
    [v5 addIndex:a3];
    char v6 = [[PUITextLayoutSet alloc] initWithTextLayoutsIndexSet:v5];
  }
  return v6;
}

- (NSString)description
{
  unint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = objc_opt_new();
  if ([(PUITextLayoutSet *)self containsTextLayout:1]) {
    [v4 addObject:@"PUITextLayoutVerticalTopRight"];
  }
  if ([(PUITextLayoutSet *)self containsTextLayout:1]) {
    [v4 addObject:@"PUITextLayoutVerticalTopRight"];
  }
  [v3 appendArraySection:v4 withName:@"supportedTextLayouts" skipIfEmpty:1];
  id v5 = [v3 build];

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUITextLayoutSet)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleLayoutSetStorage"];

  char v6 = [(PUITextLayoutSet *)self initWithTextLayoutsIndexSet:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (PUITextLayoutSet)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleLayoutSetStorage"];

  char v6 = [(PUITextLayoutSet *)self initWithTextLayoutsIndexSet:v5];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PUITextLayoutSet allocWithZone:a3];
  titleLayoutSetStorage = self->_titleLayoutSetStorage;
  return [(PUITextLayoutSet *)v4 initWithTextLayoutsIndexSet:titleLayoutSetStorage];
}

- (BOOL)allTextLayoutsAreVertical
{
  return self->_allTextLayoutsAreVertical;
}

- (void).cxx_destruct
{
}

void __48__PUITextLayoutSet_initWithTextLayoutsIndexSet___block_invoke_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v2 = (objc_class *)objc_opt_class();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __40__PUITextLayoutSet_initWithTextLayouts___block_invoke_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v2 = (objc_class *)objc_opt_class();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithTextLayout:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

@end