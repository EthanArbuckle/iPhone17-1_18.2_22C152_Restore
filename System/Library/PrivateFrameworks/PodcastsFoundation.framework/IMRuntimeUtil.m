@interface IMRuntimeUtil
+ (BOOL)associatedBoolValueForKey:(id)a3 onObject:(id)a4;
+ (BOOL)associatedBoolValueForKey:(id)a3 onObject:(id)a4 withDefault:(BOOL)a5;
+ (double)associatedDoubleValueForKey:(id)a3 onObject:(id)a4;
+ (double)associatedDoubleValueForKey:(id)a3 onObject:(id)a4 withDefault:(double)a5;
+ (float)associatedFloatValueForKey:(id)a3 onObject:(id)a4;
+ (float)associatedFloatValueForKey:(id)a3 onObject:(id)a4 withDefault:(float)a5;
+ (id)associatedValueForKey:(id)a3 onObject:(id)a4;
+ (id)associatedValueForKey:(id)a3 onObject:(id)a4 withDefault:(id)a5;
+ (int64_t)associatedIntValueForKey:(id)a3 onObject:(id)a4;
+ (int64_t)associatedIntValueForKey:(id)a3 onObject:(id)a4 withDefault:(int64_t)a5;
+ (void)associateBoolValue:(BOOL)a3 forKey:(id)a4 onObject:(id)a5;
+ (void)associateBoolValue:(BOOL)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6;
+ (void)associateDoubleValue:(double)a3 forKey:(id)a4 onObject:(id)a5;
+ (void)associateDoubleValue:(double)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6;
+ (void)associateFloatValue:(float)a3 forKey:(id)a4 onObject:(id)a5;
+ (void)associateFloatValue:(float)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6;
+ (void)associateIntValue:(int64_t)a3 forKey:(id)a4 onObject:(id)a5;
+ (void)associateIntValue:(int64_t)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6;
+ (void)associateValue:(id)a3 forKey:(id)a4 onObject:(id)a5;
+ (void)associateValue:(id)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6;
+ (void)swizzleClassMethod:(SEL)a3 onClass:(Class)a4 withReplacementBlock:(id)a5;
+ (void)swizzleMethod:(SEL)a3 onClass:(Class)a4 withReplacementBlock:(id)a5;
@end

@implementation IMRuntimeUtil

+ (void)associateBoolValue:(BOOL)a3 forKey:(id)a4 onObject:(id)a5
{
}

+ (void)associateDoubleValue:(double)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  v10 = (void *)MEMORY[0x1E4F28ED0];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 numberWithDouble:a3];
  [a1 associateValue:v13 forKey:v12 onObject:v11 withPolicy:a6];
}

+ (void)associateValue:(id)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
}

+ (BOOL)associatedBoolValueForKey:(id)a3 onObject:(id)a4 withDefault:(BOOL)a5
{
  v6 = [a1 associatedValueForKey:a3 onObject:a4];
  v7 = v6;
  if (v6) {
    a5 = [v6 BOOLValue];
  }

  return a5;
}

+ (id)associatedValueForKey:(id)a3 onObject:(id)a4 withDefault:(id)a5
{
  id v7 = a5;
  uint64_t v8 = objc_getAssociatedObject(a4, a3);
  v9 = (void *)v8;
  if (v8) {
    v10 = (void *)v8;
  }
  else {
    v10 = v7;
  }
  id v11 = v10;

  return v11;
}

+ (id)associatedValueForKey:(id)a3 onObject:(id)a4
{
  return (id)[a1 associatedValueForKey:a3 onObject:a4 withDefault:0];
}

+ (void)associateBoolValue:(BOOL)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  BOOL v8 = a3;
  v10 = (void *)MEMORY[0x1E4F28ED0];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 numberWithBool:v8];
  [a1 associateValue:v13 forKey:v12 onObject:v11 withPolicy:a6];
}

+ (void)swizzleMethod:(SEL)a3 onClass:(Class)a4 withReplacementBlock:(id)a5
{
  id v7 = a5;
  if (a3)
  {
    if (a4)
    {
      id v12 = v7;
      InstanceMethod = class_getInstanceMethod(a4, a3);
      id v7 = v12;
      if (InstanceMethod)
      {
        IMP Implementation = method_getImplementation(InstanceMethod);
        v10 = (void (*)(void))(*((uint64_t (**)(id, IMP))v12 + 2))(v12, Implementation);
        TypeEncoding = method_getTypeEncoding(InstanceMethod);
        class_replaceMethod(a4, a3, v10, TypeEncoding);
        id v7 = v12;
      }
    }
  }
}

+ (void)associateDoubleValue:(double)a3 forKey:(id)a4 onObject:(id)a5
{
}

+ (void)swizzleClassMethod:(SEL)a3 onClass:(Class)a4 withReplacementBlock:(id)a5
{
  id v7 = a5;
  if (a3)
  {
    if (a4)
    {
      id v11 = v7;
      ClassMethod = class_getClassMethod(a4, a3);
      id v7 = v11;
      if (ClassMethod)
      {
        IMP Implementation = method_getImplementation(ClassMethod);
        v10 = (void (*)(void))(*((uint64_t (**)(id, IMP))v11 + 2))(v11, Implementation);
        method_setImplementation(ClassMethod, v10);
        id v7 = v11;
      }
    }
  }
}

+ (void)associateValue:(id)a3 forKey:(id)a4 onObject:(id)a5
{
}

+ (void)associateIntValue:(int64_t)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  v10 = (void *)MEMORY[0x1E4F28ED0];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 numberWithInteger:a3];
  [a1 associateValue:v13 forKey:v12 onObject:v11 withPolicy:a6];
}

+ (void)associateIntValue:(int64_t)a3 forKey:(id)a4 onObject:(id)a5
{
}

+ (void)associateFloatValue:(float)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  v10 = (void *)MEMORY[0x1E4F28ED0];
  id v11 = a5;
  id v12 = a4;
  *(float *)&double v13 = a3;
  id v14 = [v10 numberWithFloat:v13];
  [a1 associateValue:v14 forKey:v12 onObject:v11 withPolicy:a6];
}

+ (void)associateFloatValue:(float)a3 forKey:(id)a4 onObject:(id)a5
{
}

+ (BOOL)associatedBoolValueForKey:(id)a3 onObject:(id)a4
{
  return [a1 associatedBoolValueForKey:a3 onObject:a4 withDefault:0];
}

+ (int64_t)associatedIntValueForKey:(id)a3 onObject:(id)a4
{
  return [a1 associatedIntValueForKey:a3 onObject:a4 withDefault:0];
}

+ (int64_t)associatedIntValueForKey:(id)a3 onObject:(id)a4 withDefault:(int64_t)a5
{
  v6 = [a1 associatedValueForKey:a3 onObject:a4];
  id v7 = v6;
  if (v6) {
    a5 = [v6 integerValue];
  }

  return a5;
}

+ (float)associatedFloatValueForKey:(id)a3 onObject:(id)a4
{
  [a1 associatedFloatValueForKey:a3 onObject:a4 withDefault:0.0];
  return result;
}

+ (float)associatedFloatValueForKey:(id)a3 onObject:(id)a4 withDefault:(float)a5
{
  v6 = [a1 associatedValueForKey:a3 onObject:a4];
  id v7 = v6;
  if (v6)
  {
    [v6 floatValue];
    a5 = v8;
  }

  return a5;
}

+ (double)associatedDoubleValueForKey:(id)a3 onObject:(id)a4
{
  [a1 associatedDoubleValueForKey:a3 onObject:a4 withDefault:0.0];
  return result;
}

+ (double)associatedDoubleValueForKey:(id)a3 onObject:(id)a4 withDefault:(double)a5
{
  v6 = [a1 associatedValueForKey:a3 onObject:a4];
  id v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    a5 = v8;
  }

  return a5;
}

@end