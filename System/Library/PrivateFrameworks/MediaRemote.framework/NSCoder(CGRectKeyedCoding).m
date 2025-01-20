@interface NSCoder(CGRectKeyedCoding)
- (double)mr_decodeCGRectForKey:()CGRectKeyedCoding;
- (void)mr_encodeCGRect:()CGRectKeyedCoding forKey:;
@end

@implementation NSCoder(CGRectKeyedCoding)

- (void)mr_encodeCGRect:()CGRectKeyedCoding forKey:
{
  double v11 = a2;
  double v12 = a3;
  double v13 = a4;
  double v14 = a5;
  v8 = (void *)MEMORY[0x1E4F29238];
  id v9 = a7;
  v10 = [v8 value:&v11 withObjCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  objc_msgSend(a1, "encodeObject:forKey:", v10, v9, *(void *)&v11, *(void *)&v12, *(void *)&v13, *(void *)&v14);
}

- (double)mr_decodeCGRectForKey:()CGRectKeyedCoding
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5
    && (id v6 = v5,
        !strcmp((const char *)[v6 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}")))
  {
    long long v9 = 0u;
    long long v10 = 0u;
    [v6 getValue:&v9];
  }
  else
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v9 = *MEMORY[0x1E4F1DB28];
    long long v10 = v7;
  }

  return *(double *)&v9;
}

@end