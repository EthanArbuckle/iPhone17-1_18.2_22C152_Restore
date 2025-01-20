@interface ACCObjCType
+ (id)typeForEncoding:(const char *)a3;
+ (id)typeForValue:(id)a3;
- (ACCObjCType)initWithCode:(int64_t)a3 encoding:(id)a4 name:(id)a5 className:(id)a6 size:(unint64_t)a7 flags:(unint64_t)a8;
- (BOOL)isFloatingPointNumber;
- (BOOL)isIntegerNumber;
- (BOOL)isNumber;
- (BOOL)isObject;
- (NSString)className;
- (NSString)encoding;
- (NSString)name;
- (id)objectWithBytes:(const void *)a3;
- (int64_t)code;
- (unint64_t)flags;
- (unint64_t)size;
- (void)getBytes:(void *)a3 forObject:(id)a4;
@end

@implementation ACCObjCType

+ (id)typeForEncoding:(const char *)a3
{
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  if (typeForEncoding__once != -1) {
    dispatch_once(&typeForEncoding__once, &__block_literal_global);
  }
  int v5 = *a3;
  if (v5 > 90)
  {
    switch(*a3)
    {
      case '^':
        v6 = [ACCObjCType alloc];
        v7 = @"pointer";
        uint64_t v8 = 22;
        v9 = v4;
        uint64_t v10 = 8;
        goto LABEL_46;
      case '_':
      case 'a':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
      case 't':
      case 'u':
        goto LABEL_24;
      case 'b':
        v6 = [ACCObjCType alloc];
        v7 = @"bitfield";
        uint64_t v8 = 21;
        goto LABEL_45;
      case 'c':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 0;
        goto LABEL_48;
      case 'd':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 11;
        goto LABEL_48;
      case 'f':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 10;
        goto LABEL_48;
      case 'i':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 2;
        goto LABEL_48;
      case 'l':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 3;
        goto LABEL_48;
      case 'q':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 4;
        goto LABEL_48;
      case 's':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 1;
        goto LABEL_48;
      case 'v':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 13;
        goto LABEL_48;
      default:
        if (v5 == 91)
        {
          v6 = [ACCObjCType alloc];
          v7 = @"array";
          uint64_t v8 = 18;
        }
        else
        {
          if (v5 != 123) {
            goto LABEL_24;
          }
          v6 = [ACCObjCType alloc];
          v7 = @"structure";
          uint64_t v8 = 19;
        }
        break;
    }
    goto LABEL_45;
  }
  if (v5 <= 72)
  {
    if (v5 > 57)
    {
      switch(*a3)
      {
        case ':':
          v11 = (void *)_ACCObjCTypesByCode;
          uint64_t v12 = 17;
          goto LABEL_48;
        case '@':
          if ((unint64_t)[v4 length] >= 4
            && [v4 characterAtIndex:1] == 34
            && objc_msgSend(v4, "characterAtIndex:", (char *)objc_msgSend(v4, "length") - 1) == 34)
          {
            v13 = objc_msgSend(v4, "substringWithRange:", 2, (char *)objc_msgSend(v4, "length") - 3);
            v14 = [v13 stringByAppendingString:@"*"];
            v15 = [[ACCObjCType alloc] initWithCode:15 encoding:v4 name:v14 className:v13 size:8 flags:0];

            goto LABEL_50;
          }
          v11 = (void *)_ACCObjCTypesByCode;
          uint64_t v12 = 15;
          break;
        case 'B':
          v11 = (void *)_ACCObjCTypesByCode;
          uint64_t v12 = 12;
          goto LABEL_48;
        case 'C':
          v11 = (void *)_ACCObjCTypesByCode;
          uint64_t v12 = 5;
          goto LABEL_48;
        default:
          goto LABEL_24;
      }
      goto LABEL_48;
    }
    switch(v5)
    {
      case '#':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 16;
        goto LABEL_48;
      case '(':
        v6 = [ACCObjCType alloc];
        v7 = @"union";
        uint64_t v8 = 20;
LABEL_45:
        v9 = v4;
        uint64_t v10 = 0;
LABEL_46:
        v16 = [(ACCObjCType *)v6 initWithCode:v8 encoding:v9 name:v7 className:0 size:v10 flags:0];
        goto LABEL_49;
      case '*':
        v11 = (void *)_ACCObjCTypesByCode;
        uint64_t v12 = 14;
        goto LABEL_48;
    }
    goto LABEL_24;
  }
  if (v5 > 80)
  {
    if (v5 == 81)
    {
      v11 = (void *)_ACCObjCTypesByCode;
      uint64_t v12 = 9;
      goto LABEL_48;
    }
    if (v5 == 83)
    {
      v11 = (void *)_ACCObjCTypesByCode;
      uint64_t v12 = 6;
      goto LABEL_48;
    }
    goto LABEL_24;
  }
  if (v5 == 73)
  {
    v11 = (void *)_ACCObjCTypesByCode;
    uint64_t v12 = 7;
    goto LABEL_48;
  }
  if (v5 != 76)
  {
LABEL_24:
    v6 = [ACCObjCType alloc];
    v7 = @"unknown";
    uint64_t v8 = 23;
    goto LABEL_45;
  }
  v11 = (void *)_ACCObjCTypesByCode;
  uint64_t v12 = 8;
LABEL_48:
  v16 = [v11 objectAtIndexedSubscript:v12];
LABEL_49:
  v15 = v16;
LABEL_50:

  return v15;
}

void __31__ACCObjCType_typeForEncoding___block_invoke(id a1)
{
  v19 = [[ACCObjCType alloc] initWithCode:0 encoding:@"c" name:@"char" className:0 size:1 flags:1];
  v20[0] = v19;
  v18 = [[ACCObjCType alloc] initWithCode:1 encoding:@"s" name:@"short" className:0 size:2 flags:1];
  v20[1] = v18;
  v17 = [[ACCObjCType alloc] initWithCode:2 encoding:@"i" name:@"int" className:0 size:4 flags:1];
  v20[2] = v17;
  v16 = [[ACCObjCType alloc] initWithCode:3 encoding:@"l" name:@"long" className:0 size:8 flags:1];
  v20[3] = v16;
  v15 = [[ACCObjCType alloc] initWithCode:4 encoding:@"q" name:@"long long" className:0 size:8 flags:1];
  v20[4] = v15;
  v14 = [[ACCObjCType alloc] initWithCode:5 encoding:@"C" name:@"unsigned char" className:0 size:1 flags:1];
  v20[5] = v14;
  v13 = [[ACCObjCType alloc] initWithCode:6 encoding:@"S" name:@"unsigned short" className:0 size:2 flags:1];
  v20[6] = v13;
  v1 = [[ACCObjCType alloc] initWithCode:7 encoding:@"I" name:@"unsigned int" className:0 size:4 flags:1];
  v20[7] = v1;
  v2 = [[ACCObjCType alloc] initWithCode:8 encoding:@"L" name:@"unsigned long" className:0 size:8 flags:1];
  v20[8] = v2;
  v3 = [[ACCObjCType alloc] initWithCode:9 encoding:@"Q" name:@"unsigned long long" className:0 size:8 flags:1];
  v20[9] = v3;
  v4 = [[ACCObjCType alloc] initWithCode:10 encoding:@"f" name:@"float" className:0 size:4 flags:2];
  v20[10] = v4;
  int v5 = [[ACCObjCType alloc] initWithCode:11 encoding:@"d" name:@"double" className:0 size:8 flags:2];
  v20[11] = v5;
  v6 = [[ACCObjCType alloc] initWithCode:12 encoding:@"B" name:@"BOOL" className:0 size:1 flags:1];
  v20[12] = v6;
  v7 = [[ACCObjCType alloc] initWithCode:13 encoding:@"v" name:@"void" className:0 size:1 flags:0];
  v20[13] = v7;
  uint64_t v8 = [[ACCObjCType alloc] initWithCode:14 encoding:@"*" name:@"char*" className:0 size:8 flags:0];
  v20[14] = v8;
  v9 = [[ACCObjCType alloc] initWithCode:15 encoding:@"@" name:@"id" className:0 size:8 flags:0];
  v20[15] = v9;
  uint64_t v10 = [[ACCObjCType alloc] initWithCode:16 encoding:@"#" name:@"Class" className:0 size:8 flags:0];
  v20[16] = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:v20 count:17];
  uint64_t v12 = (void *)_ACCObjCTypesByCode;
  _ACCObjCTypesByCode = v11;
}

+ (id)typeForValue:(id)a3
{
  id v3 = [a3 objCType];

  return +[ACCObjCType typeForEncoding:v3];
}

- (ACCObjCType)initWithCode:(int64_t)a3 encoding:(id)a4 name:(id)a5 className:(id)a6 size:(unint64_t)a7 flags:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ACCObjCType;
  v18 = [(ACCObjCType *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_code = a3;
    objc_storeStrong((id *)&v18->_encoding, a4);
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_className, a6);
    v19->_size = a7;
    v19->_flags = a8;
  }

  return v19;
}

- (BOOL)isNumber
{
  return (self->_flags & 3) != 0;
}

- (BOOL)isIntegerNumber
{
  return self->_flags & 1;
}

- (BOOL)isFloatingPointNumber
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isObject
{
  return self->_code == 15;
}

- (id)objectWithBytes:(const void *)a3
{
  switch(self->_code)
  {
    case 0:
      id v4 = +[NSNumber numberWithChar:*(char *)a3];
      break;
    case 1:
      id v4 = +[NSNumber numberWithShort:*(__int16 *)a3];
      break;
    case 2:
      id v4 = +[NSNumber numberWithInt:*(unsigned int *)a3];
      break;
    case 3:
      id v4 = +[NSNumber numberWithLong:*(void *)a3];
      break;
    case 4:
      id v4 = +[NSNumber numberWithLongLong:*(void *)a3];
      break;
    case 5:
      id v4 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)a3];
      break;
    case 6:
      id v4 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)a3];
      break;
    case 7:
      id v4 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)a3];
      break;
    case 8:
      id v4 = +[NSNumber numberWithUnsignedLong:*(void *)a3];
      break;
    case 9:
      id v4 = +[NSNumber numberWithUnsignedLongLong:*(void *)a3];
      break;
    case 0xALL:
      LODWORD(v3) = *(_DWORD *)a3;
      id v4 = +[NSNumber numberWithFloat:v3];
      break;
    case 0xBLL:
      id v4 = +[NSNumber numberWithDouble:*(double *)a3];
      break;
    case 0xCLL:
      id v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)a3];
      break;
    case 0xFLL:
      id v4 = *(id *)a3;
      break;
    default:
      +[NSException raise:NSInternalInconsistencyException, @"For class %@, Unsupported boxing type: %@", self->_className, self->_name format];
      id v4 = 0;
      break;
  }

  return v4;
}

- (void)getBytes:(void *)a3 forObject:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 getValue:a3];
  }
  else {
    +[NSException raise:NSInternalInconsistencyException, @"Unsupported unboxing type: %@", self->_name format];
  }
}

- (int64_t)code
{
  return self->_code;
}

- (NSString)encoding
{
  return self->_encoding;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)className
{
  return self->_className;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_encoding, 0);
}

@end