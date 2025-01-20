@interface NSMutableDictionary
- (BOOL)validateAndPopObjectForKey:(id)a3 className:(Class)a4 isOptional:(BOOL)a5 error:(id *)a6;
- (BOOL)validateObjWithKey:(id)a3 className:(Class)a4 isOptional:(BOOL)isKindOfClass error:(id *)a6;
- (id)popObjectForKey:(id)a3;
@end

@implementation NSMutableDictionary

- (id)popObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self objectForKey:v4];
  [(NSMutableDictionary *)self removeObjectForKey:v4];

  return v5;
}

- (BOOL)validateAndPopObjectForKey:(id)a3 className:(Class)a4 isOptional:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  LOBYTE(a6) = [(NSMutableDictionary *)self validateObjWithKey:v10 className:a4 isOptional:v7 error:a6];
  id v11 = [(NSMutableDictionary *)self popObjectForKey:v10];

  return (char)a6;
}

- (BOOL)validateObjWithKey:(id)a3 className:(Class)a4 isOptional:(BOOL)isKindOfClass error:(id *)a6
{
  id v9 = a3;
  id v10 = [(NSMutableDictionary *)self objectForKey:v9];
  if (v10) {
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if (a6 && !isKindOfClass)
  {
    id v11 = +[NSString stringWithFormat:@"Validation failed for dictionary key %@.", v9];
    *a6 = +[DIError errorWithPOSIXCode:22 verboseInfo:v11];
  }
  return isKindOfClass;
}

@end