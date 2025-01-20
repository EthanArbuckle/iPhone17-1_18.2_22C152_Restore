@interface RWIProtocolRuntimeTypeSet
- (BOOL)isBigInt;
- (BOOL)isBoolean;
- (BOOL)isFunction;
- (BOOL)isInteger;
- (BOOL)isNull;
- (BOOL)isNumber;
- (BOOL)isObject;
- (BOOL)isString;
- (BOOL)isSymbol;
- (BOOL)isUndefined;
- (RWIProtocolRuntimeTypeSet)initWithIsFunction:(BOOL)a3 isUndefined:(BOOL)a4 isNull:(BOOL)a5 isBoolean:(BOOL)a6 isInteger:(BOOL)a7 isNumber:(BOOL)a8 isString:(BOOL)a9 isObject:(BOOL)a10 isSymbol:(BOOL)a11 isBigInt:(BOOL)a12;
- (void)setIsBigInt:(BOOL)a3;
- (void)setIsBoolean:(BOOL)a3;
- (void)setIsFunction:(BOOL)a3;
- (void)setIsInteger:(BOOL)a3;
- (void)setIsNull:(BOOL)a3;
- (void)setIsNumber:(BOOL)a3;
- (void)setIsObject:(BOOL)a3;
- (void)setIsString:(BOOL)a3;
- (void)setIsSymbol:(BOOL)a3;
- (void)setIsUndefined:(BOOL)a3;
@end

@implementation RWIProtocolRuntimeTypeSet

- (RWIProtocolRuntimeTypeSet)initWithIsFunction:(BOOL)a3 isUndefined:(BOOL)a4 isNull:(BOOL)a5 isBoolean:(BOOL)a6 isInteger:(BOOL)a7 isNumber:(BOOL)a8 isString:(BOOL)a9 isObject:(BOOL)a10 isSymbol:(BOOL)a11 isBigInt:(BOOL)a12
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v14 = a6;
  BOOL v15 = a5;
  BOOL v16 = a4;
  BOOL v17 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RWIProtocolRuntimeTypeSet;
  v18 = [(RWIProtocolJSONObject *)&v22 init];
  v19 = v18;
  if (v18)
  {
    [(RWIProtocolRuntimeTypeSet *)v18 setIsFunction:v17];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsUndefined:v16];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsNull:v15];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsBoolean:v14];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsInteger:v13];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsNumber:v12];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsString:a9];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsObject:a10];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsSymbol:a11];
    [(RWIProtocolRuntimeTypeSet *)v19 setIsBigInt:a12];
    v20 = v19;
  }

  return v19;
}

- (void)setIsFunction:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isFunction"];
}

- (BOOL)isFunction
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isFunction"];
}

- (void)setIsUndefined:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isUndefined"];
}

- (BOOL)isUndefined
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isUndefined"];
}

- (void)setIsNull:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isNull"];
}

- (BOOL)isNull
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isNull"];
}

- (void)setIsBoolean:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isBoolean"];
}

- (BOOL)isBoolean
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isBoolean"];
}

- (void)setIsInteger:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isInteger"];
}

- (BOOL)isInteger
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isInteger"];
}

- (void)setIsNumber:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isNumber"];
}

- (BOOL)isNumber
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isNumber"];
}

- (void)setIsString:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isString"];
}

- (BOOL)isString
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isString"];
}

- (void)setIsObject:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isObject"];
}

- (BOOL)isObject
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isObject"];
}

- (void)setIsSymbol:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isSymbol"];
}

- (BOOL)isSymbol
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isSymbol"];
}

- (void)setIsBigInt:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isBigInt"];
}

- (BOOL)isBigInt
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isBigInt"];
}

@end