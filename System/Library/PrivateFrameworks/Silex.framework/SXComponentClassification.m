@interface SXComponentClassification
+ (BOOL)shouldRegister;
+ (id)classificationForClass:(uint64_t)a1;
+ (id)classificationForComponentWithRole:(int)a3;
+ (id)classificationForComponentWithType:(id)a3;
+ (id)classificationForComponentWithType:(id)a3 role:(id)a4;
+ (id)roleString;
+ (id)typeString;
+ (int)role;
+ (void)initialize;
+ (void)registerClassification;
- (BOOL)accessibilitySkippedDuringReadAll;
- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4;
- (BOOL)isCollapsible;
- (Class)componentModelClass;
- (NSArray)defaultComponentStyleIdentifiers;
- (NSArray)defaultStyleIdentifiers;
- (NSArray)defaultTextStyleIdentifiers;
- (SXComponentClassification)init;
- (SXComponentLayoutRules)layoutRules;
- (SXComponentTextRules)textRules;
- (id)accessibilityContextualLabel;
- (id)accessibilityCustomRotorMembership;
- (unint64_t)contentRelevance;
- (void)setupStyleIdentifiers;
@end

@implementation SXComponentClassification

+ (id)classificationForComponentWithType:(id)a3 role:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6
    || !v7
    || ([NSString stringWithFormat:@"%@-%@", v6, v7],
        v9 = objc_claimAutoreleasedReturnValue(),
        v10 = (objc_class *)(id)[(id)__classificationClasses objectForKey:v9], v9, !v10))
  {
    v11 = [NSString stringWithFormat:@"%@-%@", v6, SXComponentClassificationUnknownRoleString];
    v10 = (objc_class *)(id)[(id)__classificationClasses objectForKey:v11];
  }
  v12 = +[SXComponentClassification classificationForClass:]((uint64_t)a1, v10);

  return v12;
}

+ (id)classificationForClass:(uint64_t)a1
{
  self;
  if (!a2) {
    a2 = (objc_class *)objc_opt_class();
  }
  v3 = NSStringFromClass(a2);
  os_unfair_lock_lock_with_options();
  id v4 = [(id)__classifications objectForKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&__unfairLock);
  if (!v4)
  {
    id v4 = objc_alloc_init(a2);
    os_unfair_lock_lock_with_options();
    [(id)__classifications setObject:v4 forKey:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)&__unfairLock);
  }

  return v4;
}

- (SXComponentClassification)init
{
  v5.receiver = self;
  v5.super_class = (Class)SXComponentClassification;
  v2 = [(SXComponentClassification *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SXComponentClassification *)v2 setupStyleIdentifiers];
  }
  return v3;
}

- (void)setupStyleIdentifiers
{
  v13 = [(id)objc_opt_class() roleString];
  v3 = [(id)objc_opt_class() typeString];
  id v4 = [MEMORY[0x263EFF9B0] orderedSetWithObject:@"default"];
  if (v3 && v3 != (void *)SXComponentClassificationUnknownTypeString)
  {
    objc_super v5 = SXDefaultComponentStyleIdentifierForRole((uint64_t)v3);
    [v4 addObject:v5];

    id v6 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    id v7 = SXDefaultComponentStyleIdentifierForRole((uint64_t)v6);
    [v4 addObject:v7];
  }
  if (v13 && v13 != SXComponentClassificationUnknownRoleString)
  {
    v8 = SXDefaultComponentStyleIdentifierForRole((uint64_t)v13);
    [v4 addObject:v8];

    v9 = [(__CFString *)v13 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    v10 = SXDefaultComponentStyleIdentifierForRole((uint64_t)v9);
    [v4 addObject:v10];
  }
  v11 = [v4 array];
  defaultStyleIdentifiers = self->_defaultStyleIdentifiers;
  self->_defaultStyleIdentifiers = v11;
}

+ (id)classificationForComponentWithType:(id)a3
{
  id v4 = (objc_class *)(id)[(id)__defaultClassificationsByType objectForKey:a3];
  return +[SXComponentClassification classificationForClass:]((uint64_t)a1, v4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
    v3 = (void *)__classificationClasses;
    __classificationClasses = v2;

    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    objc_super v5 = (void *)__classificationClassesByRole;
    __classificationClassesByRole = v4;

    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    id v7 = (void *)__defaultClassificationsByType;
    __defaultClassificationsByType = v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = (void *)__classifications;
    __classifications = v8;

    __unfairLock = 0;
    +[SXComponentClassificationRegister registerClasses];
  }
}

+ (void)registerClassification
{
  id v8 = [a1 typeString];
  v3 = [a1 roleString];
  uint64_t v4 = [a1 role];
  objc_super v5 = [NSString stringWithFormat:@"%@-%@", v8, v3];
  [(id)__classificationClasses setObject:a1 forKey:v5];
  if (v4)
  {
    uint64_t v6 = (void *)__classificationClassesByRole;
    id v7 = [NSNumber numberWithInt:v4];
    [v6 setObject:a1 forKey:v7];
  }
  else
  {
    [(id)__defaultClassificationsByType setObject:a1 forKey:v8];
  }
}

+ (id)classificationForComponentWithRole:(int)a3
{
  if (a3)
  {
    objc_super v5 = (void *)__classificationClassesByRole;
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:");
    id v7 = (objc_class *)(id)[v5 objectForKey:v6];

    id v8 = +[SXComponentClassification classificationForClass:]((uint64_t)a1, v7);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

+ (BOOL)shouldRegister
{
  return 1;
}

+ (id)typeString
{
  return (id)SXComponentClassificationUnknownTypeString;
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (id)accessibilityContextualLabel
{
  return 0;
}

- (id)accessibilityCustomRotorMembership
{
  return 0;
}

- (BOOL)accessibilitySkippedDuringReadAll
{
  return 1;
}

- (SXComponentLayoutRules)layoutRules
{
  return (SXComponentLayoutRules *)+[SXComponentLayoutRules defaultLayoutRules];
}

- (SXComponentTextRules)textRules
{
  return (SXComponentTextRules *)+[SXComponentTextRules defaultTextRules];
}

- (NSArray)defaultTextStyleIdentifiers
{
  return self->_defaultStyleIdentifiers;
}

- (NSArray)defaultComponentStyleIdentifiers
{
  return self->_defaultStyleIdentifiers;
}

- (unint64_t)contentRelevance
{
  uint64_t v2 = [(SXComponentClassification *)self textRules];
  BOOL v3 = [v2 textFlow] == 1;

  return 2 * v3;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAffiliationWithClassification:(id)a3 forDirection:(int64_t)a4
{
  return 0;
}

- (BOOL)isCollapsible
{
  return 0;
}

- (NSArray)defaultStyleIdentifiers
{
  return self->_defaultStyleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultStyleIdentifiers, 0);
  objc_storeStrong((id *)&self->_textRules, 0);
  objc_storeStrong((id *)&self->_layoutRules, 0);
}

@end