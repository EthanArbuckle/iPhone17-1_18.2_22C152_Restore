@interface UIAccessibilityInMemoryStringBasedTreeLogger
- (UIAccessibilityInMemoryStringBasedTreeLogger)init;
- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithElementDescriptionKey:(id)a3;
- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithPrefix:(id)a3;
- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithPrefix:(id)a3 elementDescriptionKey:(id)a4;
- (id)stringRepresentation;
- (void)logElement:(id)a3;
- (void)pop;
- (void)push;
@end

@implementation UIAccessibilityInMemoryStringBasedTreeLogger

- (UIAccessibilityInMemoryStringBasedTreeLogger)init
{
  return [(UIAccessibilityInMemoryStringBasedTreeLogger *)self initWithPrefix:@" |"];
}

- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithPrefix:(id)a3
{
  return [(UIAccessibilityInMemoryStringBasedTreeLogger *)self initWithPrefix:a3 elementDescriptionKey:@"description"];
}

- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithElementDescriptionKey:(id)a3
{
  return [(UIAccessibilityInMemoryStringBasedTreeLogger *)self initWithPrefix:@" |" elementDescriptionKey:@"description"];
}

- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithPrefix:(id)a3 elementDescriptionKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v8 length])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"UIAccessibilityInMemoryStringBasedTreeLogger.m", 42, @"Invalid parameter not satisfying: %@", @"[descriptionKey length] > 0" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)UIAccessibilityInMemoryStringBasedTreeLogger;
  v9 = [(UIAccessibilityInMemoryStringBasedTreeLogger *)&v20 init];
  if (v9)
  {
    v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    stringRepresentation = v9->_stringRepresentation;
    v9->_stringRepresentation = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentPrefix = v9->_currentPrefix;
    v9->_currentPrefix = v12;

    uint64_t v14 = [v7 copy];
    prefix = v9->_prefix;
    v9->_prefix = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    descriptionKey = v9->_descriptionKey;
    v9->_descriptionKey = (NSString *)v16;
  }
  return v9;
}

- (id)stringRepresentation
{
  v2 = (void *)[(NSMutableString *)self->_stringRepresentation copy];

  return v2;
}

- (void)logElement:(id)a3
{
  currentPrefix = self->_currentPrefix;
  id v5 = a3;
  id v8 = [(NSMutableArray *)currentPrefix componentsJoinedByString:&stru_1EF1680E8];
  objc_opt_class();
  v6 = [v5 safeValueForKey:self->_descriptionKey];

  id v7 = __UIAccessibilityCastAsClass();

  [(NSMutableString *)self->_stringRepresentation appendFormat:@"%@ %@\n", v8, v7];
}

- (void)push
{
}

- (void)pop
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionKey, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_currentPrefix, 0);

  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

@end