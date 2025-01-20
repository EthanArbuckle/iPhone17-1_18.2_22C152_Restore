@interface NSInvocation
+ (const)_typeWithoutQualifiers:(const char *)a3;
- (id)BOOLDescriptionAtIndex:(int64_t)a3;
- (id)argumentDescriptionForIndex:(int64_t)a3;
- (id)blockDescriptionAtIndex:(int64_t)a3;
- (id)blockInvocationDescription;
- (id)cStringDescriptionAtIndex:(int64_t)a3;
- (id)charDescriptionAtIndex:(int64_t)a3;
- (id)doubleDescriptionAtIndex:(int64_t)a3;
- (id)floatDescriptionAtIndex:(int64_t)a3;
- (id)intDescriptionAtIndex:(int64_t)a3;
- (id)invocationDescription;
- (id)longDescriptionAtIndex:(int64_t)a3;
- (id)longDoubleDescriptionAtIndex:(int64_t)a3;
- (id)longLongDescriptionAtIndex:(int64_t)a3;
- (id)objectDescriptionAtIndex:(int64_t)a3;
- (id)pointerDescriptionAtIndex:(int64_t)a3;
- (id)selectorDescriptionAtIndex:(int64_t)a3;
- (id)shortDescriptionAtIndex:(int64_t)a3;
- (id)unsignedCharDescriptionAtIndex:(int64_t)a3;
- (id)unsignedIntDescriptionAtIndex:(int64_t)a3;
- (id)unsignedLongDescriptionAtIndex:(int64_t)a3;
- (id)unsignedLongLongDescriptionAtIndex:(int64_t)a3;
- (id)unsignedShortDescriptionAtIndex:(int64_t)a3;
- (int64_t)getBlockArgumentIndex;
@end

@implementation NSInvocation

+ (const)_typeWithoutQualifiers:(const char *)a3
{
  v3 = a3 - 1;
  do
    int v4 = *++v3;
  while (memchr("rnNoORV", v4, 8uLL));
  return v3;
}

- (id)invocationDescription
{
  v3 = [(NSInvocation *)self methodSignature];
  id v4 = [v3 numberOfArguments];
  v5 = NSStringFromSelector([(NSInvocation *)self selector]);
  id v6 = v5;
  if (v4 != (id)2)
  {
    v13 = v3;
    v7 = [v5 componentsSeparatedByString:@":"];

    id v6 = objc_alloc_init((Class)NSMutableString);
    if ((unint64_t)v4 >= 3)
    {
      for (unint64_t i = 2; (id)i != v4; ++i)
      {
        if (i <= 2) {
          CFStringRef v9 = &stru_1000C35D8;
        }
        else {
          CFStringRef v9 = @" ";
        }
        v10 = [v7 objectAtIndex:i - 2];
        [v6 appendFormat:@"%@%@:", v9, v10];

        v11 = [(NSInvocation *)self argumentDescriptionForIndex:i];
        [v6 appendString:v11];
      }
    }

    v3 = v13;
  }

  return v6;
}

- (id)blockInvocationDescription
{
  v3 = [(NSInvocation *)self methodSignature];
  id v4 = [v3 numberOfArguments];
  if (v4 == (id)1)
  {
    v5 = @"block(void)";
  }
  else
  {
    id v6 = v4;
    v5 = (__CFString *)objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", @"block(");
    if (v6)
    {
      for (unint64_t i = 1; (id)i != v6; ++i)
      {
        if (i <= 1) {
          CFStringRef v8 = &stru_1000C35D8;
        }
        else {
          CFStringRef v8 = @", ";
        }
        [(__CFString *)v5 appendFormat:@"%@", v8];
        CFStringRef v9 = [(NSInvocation *)self argumentDescriptionForIndex:i];
        [(__CFString *)v5 appendString:v9];
      }
    }
    [(__CFString *)v5 appendString:@""]);
  }

  return v5;
}

- (id)argumentDescriptionForIndex:(int64_t)a3
{
  id v5 = [(NSInvocation *)self methodSignature];
  id v6 = [v5 getArgumentTypeAtIndex:a3];

  unsigned int v7 = *(unsigned __int8 *)[(id)objc_opt_class() _typeWithoutQualifiers:v6];
  if (v7 > 0x52)
  {
    switch(v7)
    {
      case 'c':
        CFStringRef v8 = [(NSInvocation *)self charDescriptionAtIndex:a3];
        break;
      case 'd':
        CFStringRef v8 = [(NSInvocation *)self doubleDescriptionAtIndex:a3];
        break;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
        goto LABEL_16;
      case 'f':
        CFStringRef v8 = [(NSInvocation *)self floatDescriptionAtIndex:a3];
        break;
      case 'i':
        CFStringRef v8 = [(NSInvocation *)self intDescriptionAtIndex:a3];
        break;
      case 'q':
        CFStringRef v8 = [(NSInvocation *)self longDescriptionAtIndex:a3];
        break;
      case 'r':
        CFStringRef v8 = [(NSInvocation *)self cStringDescriptionAtIndex:a3];
        break;
      case 's':
        CFStringRef v8 = [(NSInvocation *)self shortDescriptionAtIndex:a3];
        break;
      default:
        if (v7 == 83)
        {
          CFStringRef v8 = [(NSInvocation *)self unsignedShortDescriptionAtIndex:a3];
        }
        else if (v7 == 94)
        {
          CFStringRef v8 = [(NSInvocation *)self pointerDescriptionAtIndex:a3];
        }
        else
        {
LABEL_16:
          CFStringRef v8 = [@"<??" stringByAppendingString:@">"];
        }
        break;
    }
  }
  else
  {
    switch(v7)
    {
      case '@':
        CFStringRef v8 = [(NSInvocation *)self objectDescriptionAtIndex:a3];
        break;
      case 'A':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
        goto LABEL_16;
      case 'B':
        CFStringRef v8 = [(NSInvocation *)self BOOLDescriptionAtIndex:a3];
        break;
      case 'C':
        CFStringRef v8 = [(NSInvocation *)self unsignedCharDescriptionAtIndex:a3];
        break;
      case 'D':
        CFStringRef v8 = [(NSInvocation *)self longDoubleDescriptionAtIndex:a3];
        break;
      case 'I':
        CFStringRef v8 = [(NSInvocation *)self unsignedIntDescriptionAtIndex:a3];
        break;
      default:
        if (v7 == 58)
        {
          CFStringRef v8 = [(NSInvocation *)self selectorDescriptionAtIndex:a3];
        }
        else
        {
          if (v7 != 81) {
            goto LABEL_16;
          }
          CFStringRef v8 = [(NSInvocation *)self unsignedLongDescriptionAtIndex:a3];
        }
        break;
    }
  }
  return v8;
}

- (id)objectDescriptionAtIndex:(int64_t)a3
{
  id v9 = 0;
  [(NSInvocation *)self getArgument:&v9 atIndex:a3];
  if (v9)
  {
    if (([v9 isProxy] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (([v9 isProxy] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<NSOrderedSet of %d objects>", [v9 count]);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v9 description];
      v3 = (void *)v6;
      unsigned int v7 = @"<nil description>";
      if (v6) {
        unsigned int v7 = (__CFString *)v6;
      }
      id v4 = v7;
    }
    else
    {
      v3 = [v9 description];
      id v4 = +[NSString stringWithFormat:@"@\"%@\"", v3];
    }
    id v5 = v4;
  }
  else
  {
    id v5 = @"nil";
  }
LABEL_13:
  return v5;
}

- (id)BOOLDescriptionAtIndex:(int64_t)a3
{
  char v6 = 0;
  [(NSInvocation *)self getArgument:&v6 atIndex:a3];
  if (v6) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  id v4 = v3;
  return v4;
}

- (id)charDescriptionAtIndex:(int64_t)a3
{
  memset(v6, 0, sizeof(v6));
  [(NSInvocation *)self getArgument:v6 atIndex:a3];
  if (BYTE1(v6[0]) || LOBYTE(v6[0]) > 1u)
  {
    id v4 = +[NSString stringWithFormat:@"'%c'", LOBYTE(v6[0])];
  }
  else
  {
    v3 = @"NO";
    if (LOBYTE(v6[0]) == 1) {
      v3 = @"YES";
    }
    id v4 = v3;
  }
  return v4;
}

- (id)unsignedCharDescriptionAtIndex:(int64_t)a3
{
  memset(v5, 0, sizeof(v5));
  [(NSInvocation *)self getArgument:v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"'%c'", LOBYTE(v5[0])];
  return v3;
}

- (id)intDescriptionAtIndex:(int64_t)a3
{
  unsigned int v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%d", v5];
  return v3;
}

- (id)unsignedIntDescriptionAtIndex:(int64_t)a3
{
  unsigned int v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%d", v5];
  return v3;
}

- (id)shortDescriptionAtIndex:(int64_t)a3
{
  __int16 v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%hi", v5];
  return v3;
}

- (id)unsignedShortDescriptionAtIndex:(int64_t)a3
{
  unsigned __int16 v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%hu", v5];
  return v3;
}

- (id)longDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%ld", v5];
  return v3;
}

- (id)unsignedLongDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%lu", v5];
  return v3;
}

- (id)longLongDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%qi", v5];
  return v3;
}

- (id)unsignedLongLongDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%qu", v5];
  return v3;
}

- (id)doubleDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%f", v5];
  return v3;
}

- (id)floatDescriptionAtIndex:(int64_t)a3
{
  float v5 = 0.0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%f", v5];
  return v3;
}

- (id)longDoubleDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%Lf", v5];
  return v3;
}

- (id)pointerDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%p", v5];
  return v3;
}

- (id)cStringDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  __strlcpy_chk();
  __strlcpy_chk();
  v3 = +[NSString stringWithFormat:@"\"%s\"", v6];
  return v3;
}

- (id)selectorDescriptionAtIndex:(int64_t)a3
{
  SEL aSelector = 0;
  [(NSInvocation *)self getArgument:&aSelector atIndex:a3];
  v3 = NSStringFromSelector(aSelector);
  id v4 = +[NSString stringWithFormat:@"@selector(%@)", v3];

  return v4;
}

- (id)blockDescriptionAtIndex:(int64_t)a3
{
  uint64_t v5 = 0;
  [(NSInvocation *)self getArgument:&v5 atIndex:a3];
  v3 = +[NSString stringWithFormat:@"%@", v5];
  return v3;
}

- (int64_t)getBlockArgumentIndex
{
  v2 = [(NSInvocation *)self methodSignature];
  id v3 = [v2 numberOfArguments];
  if ((unint64_t)v3 < 3)
  {
LABEL_5:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v4 = v3;
    int64_t v5 = 2;
    while (strcmp((const char *)[v2 getArgumentTypeAtIndex:v5], "@?"))
    {
      if (v4 == (id)++v5) {
        goto LABEL_5;
      }
    }
  }

  return v5;
}

@end