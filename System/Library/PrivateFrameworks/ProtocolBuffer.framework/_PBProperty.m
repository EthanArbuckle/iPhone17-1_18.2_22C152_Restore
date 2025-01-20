@interface _PBProperty
+ (id)getValidPropertiesForType:(void *)a3 withCache:;
- (id)_parseStructDefinition:(uint64_t)a1;
- (id)description;
- (uint64_t)getCountOfRepeatedValuesFromInstance:(uint64_t)a1;
- (void)dealloc;
- (void)setNumberValue:(uint64_t)a3 onInstance:;
@end

@implementation _PBProperty

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = v3;
  int subType = self->_subType;
  if (self->_subType)
  {
    if (subType == 123)
    {
      structName = (__CFString *)self->_structName;
      if (!structName) {
        structName = @"?";
      }
      [v3 appendFormat:@"{%@=", structName];
      objc_msgSend(v4, "appendString:", -[NSArray componentsJoinedByString:](self->_structFields, "componentsJoinedByString:", &stru_1EFF81660));
      v7 = @"}";
    }
    else if ((char)subType > 82)
    {
      switch((char)subType)
      {
        case 'c':
          v7 = @"char";
          break;
        case 'd':
          v7 = @"double";
          break;
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
          goto LABEL_52;
        case 'f':
          v7 = @"float";
          break;
        case 'i':
          v7 = @"int";
          break;
        case 'l':
          v7 = @"long";
          break;
        case 'q':
          v7 = @"long long";
          break;
        case 's':
          v7 = @"short";
          break;
        default:
          if ((char)subType == 83)
          {
            v7 = @"unsigned short";
          }
          else if ((char)subType == 94)
          {
            v7 = @"*";
          }
          else
          {
LABEL_52:
            v7 = @"?";
          }
          break;
      }
    }
    else
    {
      switch((char)subType)
      {
        case '@':
          v7 = @"id";
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_52;
        case 'B':
          v7 = @"BOOL";
          break;
        case 'C':
          v7 = @"unsigned char";
          break;
        case 'I':
          v7 = @"unsigned int";
          break;
        default:
          if ((char)subType == 76)
          {
            v7 = @"unsigned long";
          }
          else
          {
            if ((char)subType != 81) {
              goto LABEL_52;
            }
            v7 = @"unsigned long long";
          }
          break;
      }
    }
    [v4 appendString:v7];
  }
  int type = self->_type;
  if (type == 123)
  {
    v11 = (__CFString *)self->_structName;
    if (!v11) {
      v11 = @"?";
    }
    [v4 appendFormat:@"{%@=", v11];
    objc_msgSend(v4, "appendString:", -[NSArray componentsJoinedByString:](self->_structFields, "componentsJoinedByString:", &stru_1EFF81660));
    v12 = @"}";
  }
  else
  {
    if (type == 64)
    {
      Class subObjectType = self->_subObjectType;
      v10 = NSStringFromClass(self->_objectType);
      if (subObjectType) {
        [v4 appendFormat:@"%@<%@*>*", v10, NSStringFromClass(self->_subObjectType)];
      }
      else {
        [v4 appendFormat:@"%@*", v10, v15];
      }
      goto LABEL_26;
    }
    if ((char)type > 82)
    {
      switch((char)type)
      {
        case 'c':
          v12 = @"char";
          break;
        case 'd':
          v12 = @"double";
          break;
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
          goto LABEL_53;
        case 'f':
          v12 = @"float";
          break;
        case 'i':
          v12 = @"int";
          break;
        case 'l':
          v12 = @"long";
          break;
        case 'q':
          v12 = @"long long";
          break;
        case 's':
          v12 = @"short";
          break;
        default:
          if ((char)type == 83)
          {
            v12 = @"unsigned short";
          }
          else if ((char)type == 94)
          {
            v12 = @"*";
          }
          else
          {
LABEL_53:
            v12 = @"?";
          }
          break;
      }
    }
    else
    {
      switch((char)type)
      {
        case '@':
          v12 = @"id";
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_53;
        case 'B':
          v12 = @"BOOL";
          break;
        case 'C':
          v12 = @"unsigned char";
          break;
        case 'I':
          v12 = @"unsigned int";
          break;
        default:
          if ((char)type == 76)
          {
            v12 = @"unsigned long";
          }
          else
          {
            if ((char)type != 81) {
              goto LABEL_53;
            }
            v12 = @"unsigned long long";
          }
          break;
      }
    }
  }
  [v4 appendString:v12];
LABEL_26:
  [v4 appendFormat:@" %@;", self->_name];
  if (self->_has)
  {
    v13 = @" (optional)";
  }
  else if (self->_count)
  {
    v13 = @" (repeated)";
  }
  else
  {
    v13 = @" (required)";
  }
  [v4 appendFormat:v13];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_PBProperty;
  [(_PBProperty *)&v3 dealloc];
}

- (id)_parseStructDefinition:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "length"));
  if ([a2 length])
  {
    unint64_t v5 = 0;
    uint64_t v27 = 0;
    v6 = @"ignoring struct field: %c in %@";
    while (1)
    {
      uint64_t v7 = (char)[a2 characterAtIndex:v5];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v7);
      if ((int)v7 <= 93) {
        break;
      }
      if ((v7 - 99) > 0x1A) {
        goto LABEL_23;
      }
      if (((1 << (v7 - 99)) & 0x1424B) != 0) {
        goto LABEL_11;
      }
      if (v7 == 123)
      {
        unint64_t v14 = v5 + 1;
        if (v5 + 1 >= [a2 length])
        {
          ++v5;
        }
        else
        {
          ++v5;
          do
          {
            if ([a2 characterAtIndex:v5] == 61) {
              break;
            }
            ++v5;
          }
          while (v5 < [a2 length]);
          if (*(void *)(a1 + 104)) {
            BOOL v15 = 1;
          }
          else {
            BOOL v15 = v5 == v14;
          }
          if (!v15) {
            *(void *)(a1 + 104) = (id)objc_msgSend(a2, "substringWithRange:", v14, v5 - v14);
          }
        }
        goto LABEL_12;
      }
      if (v7 != 125)
      {
LABEL_23:
        if (v7 != 94)
        {
          if (v7 != 98) {
            goto LABEL_29;
          }
          v9 = v6;
          uint64_t v10 = a1;
          id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          for (unint64_t i = v5 + 1; i < [a2 length]; ++i)
          {
            uint64_t v13 = [a2 characterAtIndex:i];
            if ((v13 - 48) > 9) {
              break;
            }
            unint64_t v5 = i;
            objc_msgSend(v11, "appendFormat:", @"%C", v13);
          }
          int v16 = [v11 intValue];
          v27 += v16;
          a1 = v10;
          v6 = v9;
          if (!v16) {
            goto LABEL_12;
          }
        }
LABEL_11:
        [v4 addObject:v8];
      }
LABEL_12:
      if (++v5 >= [a2 length]) {
        goto LABEL_43;
      }
    }
    if ((int)v7 > 72)
    {
      if ((int)v7 > 80)
      {
        if (v7 != 81 && v7 != 83) {
          goto LABEL_29;
        }
      }
      else if (v7 != 73 && v7 != 76)
      {
        goto LABEL_29;
      }
    }
    else if ((v7 - 66) >= 2)
    {
      if (v7 == 61 || v7 == 63) {
        goto LABEL_12;
      }
LABEL_29:
      NSLog(&v6->isa, v7, a2);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v27 = 0;
LABEL_43:
  if (![v4 count]) {
    return 0;
  }
  id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(a2, "length"));
  [v17 appendString:@"{?="];
  uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%c", 98);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v19 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v4);
        }
        v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        if (([v23 isEqualToString:v18] & 1) == 0) {
          [v17 appendString:v23];
        }
      }
      uint64_t v20 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }
  if (v27) {
    objc_msgSend(v17, "appendFormat:", @"%c", 105);
  }
  [v17 appendString:@"}"];
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment((const char *)[v17 UTF8String], &sizep, 0);
  uint64_t v24 = [v4 copy];
  NSUInteger v25 = sizep;
  *(void *)(a1 + 112) = v24;
  *(void *)(a1 + 120) = v25;
  if (*(unsigned char *)(a1 + 32) == 94) {
    [v17 insertString:@"^" atIndex:0];
  }
  return v17;
}

- (uint64_t)getCountOfRepeatedValuesFromInstance:(uint64_t)a1
{
  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    id v4 = (char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "methodSignature"), "methodReturnType");
    unint64_t v5 = 0;
    int v6 = *v4;
    if (v6 <= 80)
    {
      if (v6 > 72)
      {
        if (v6 == 73)
        {
          LODWORD(v9) = 0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[NSNumber numberWithUnsignedInt:LODWORD(v9)];
        }
        else if (v6 == 76)
        {
          double v9 = 0.0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[NSNumber numberWithUnsignedLong:*(void *)&v9];
        }
      }
      else if (v6 == 66)
      {
        LOBYTE(v9) = 0;
        [v2 invokeWithTarget:a2];
        [v2 getReturnValue:&v9];
        unint64_t v5 = (void *)[NSNumber numberWithBool:LOBYTE(v9)];
      }
      else if (v6 == 67)
      {
        LOBYTE(v9) = 0;
        [v2 invokeWithTarget:a2];
        [v2 getReturnValue:&v9];
        unint64_t v5 = (void *)[NSNumber numberWithUnsignedChar:LOBYTE(v9)];
      }
    }
    else
    {
      switch(v6)
      {
        case 'c':
          LOBYTE(v9) = 0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[NSNumber numberWithChar:SLOBYTE(v9)];
          break;
        case 'd':
          double v9 = 0.0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[NSNumber numberWithDouble:v9];
          break;
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
          return [v5 unsignedIntegerValue];
        case 'f':
          LODWORD(v9) = 0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          LODWORD(v8) = LODWORD(v9);
          unint64_t v5 = (void *)[NSNumber numberWithFloat:v8];
          break;
        case 'i':
          LODWORD(v9) = 0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[NSNumber numberWithInt:LODWORD(v9)];
          break;
        case 'l':
          double v9 = 0.0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[NSNumber numberWithLong:*(void *)&v9];
          break;
        case 'q':
          double v9 = 0.0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[NSNumber numberWithLongLong:*(void *)&v9];
          break;
        case 's':
          LOWORD(v9) = 0;
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[NSNumber numberWithShort:SLOWORD(v9)];
          break;
        default:
          if (v6 == 81)
          {
            double v9 = 0.0;
            [v2 invokeWithTarget:a2];
            [v2 getReturnValue:&v9];
            unint64_t v5 = (void *)[NSNumber numberWithUnsignedLongLong:*(void *)&v9];
          }
          else if (v6 == 83)
          {
            LOWORD(v9) = 0;
            [v2 invokeWithTarget:a2];
            [v2 getReturnValue:&v9];
            unint64_t v5 = (void *)[NSNumber numberWithUnsignedShort:LOWORD(v9)];
          }
          break;
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return [v5 unsignedIntegerValue];
}

- (void)setNumberValue:(uint64_t)a3 onInstance:
{
  uint64_t v18 = a2;
  if (a1)
  {
    int v5 = *(unsigned __int8 *)(a1 + 32);
    if (v5 == 94) {
      LOBYTE(v5) = *(unsigned char *)(a1 + 33);
    }
    if ((char)v5 > 80)
    {
      switch((char)v5)
      {
        case 'c':
          LOBYTE(v17) = 0;
          int v6 = *(void **)(a1 + 80);
          if (v6) {
            goto LABEL_22;
          }
          char v7 = objc_msgSend(a2, "charValue", v17, v18);
          goto LABEL_40;
        case 'd':
          uint64_t v17 = 0;
          double v8 = *(void **)(a1 + 80);
          if (v8) {
            goto LABEL_38;
          }
          objc_msgSend(a2, "doubleValue", v17, v18);
          uint64_t v17 = v14;
          goto LABEL_50;
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
          return;
        case 'f':
          LODWORD(v17) = 0;
          v12 = *(void **)(a1 + 80);
          if (v12) {
            goto LABEL_30;
          }
          objc_msgSend(a2, "floatValue", v17, v18);
          LODWORD(v17) = v15;
          goto LABEL_44;
        case 'i':
          LODWORD(v17) = 0;
          v12 = *(void **)(a1 + 80);
          if (v12) {
            goto LABEL_30;
          }
          int v13 = [a2 intValue];
          goto LABEL_43;
        case 'l':
          uint64_t v17 = 0;
          double v8 = *(void **)(a1 + 80);
          if (v8) {
            goto LABEL_38;
          }
          uint64_t v9 = [a2 longValue];
          goto LABEL_49;
        case 'q':
          uint64_t v17 = 0;
          double v8 = *(void **)(a1 + 80);
          if (v8) {
            goto LABEL_38;
          }
          uint64_t v9 = [a2 longLongValue];
          goto LABEL_49;
        case 's':
          LOWORD(v17) = 0;
          uint64_t v10 = *(void **)(a1 + 80);
          if (v10) {
            goto LABEL_36;
          }
          __int16 v11 = [a2 shortValue];
          goto LABEL_46;
        default:
          if ((char)v5 != 81)
          {
            if ((char)v5 != 83) {
              return;
            }
            LOWORD(v17) = 0;
            uint64_t v10 = *(void **)(a1 + 80);
            if (v10)
            {
LABEL_36:
              objc_msgSend(v10, "setArgument:atIndex:", &v18, 2, v17);
              [*(id *)(a1 + 80) invokeWithTarget:a3];
              [*(id *)(a1 + 80) getReturnValue:&v17];
            }
            else
            {
              __int16 v11 = [a2 unsignedShortValue];
LABEL_46:
              LOWORD(v17) = v11;
            }
            int v16 = malloc_type_calloc(1uLL, 2uLL, 0x1000040BDFB0063uLL);
            *int v16 = v17;
            goto LABEL_51;
          }
          uint64_t v17 = 0;
          double v8 = *(void **)(a1 + 80);
          if (v8) {
            goto LABEL_38;
          }
          uint64_t v9 = [a2 unsignedLongLongValue];
          break;
      }
      goto LABEL_49;
    }
    if ((char)v5 > 72)
    {
      if ((char)v5 == 73)
      {
        LODWORD(v17) = 0;
        v12 = *(void **)(a1 + 80);
        if (v12)
        {
LABEL_30:
          objc_msgSend(v12, "setArgument:atIndex:", &v18, 2, v17);
          [*(id *)(a1 + 80) invokeWithTarget:a3];
          [*(id *)(a1 + 80) getReturnValue:&v17];
        }
        else
        {
          int v13 = [a2 unsignedIntValue];
LABEL_43:
          LODWORD(v17) = v13;
        }
LABEL_44:
        int v16 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
        *(_DWORD *)int v16 = v17;
        goto LABEL_51;
      }
      if ((char)v5 != 76) {
        return;
      }
      uint64_t v17 = 0;
      double v8 = *(void **)(a1 + 80);
      if (v8)
      {
LABEL_38:
        objc_msgSend(v8, "setArgument:atIndex:", &v18, 2, v17);
        [*(id *)(a1 + 80) invokeWithTarget:a3];
        [*(id *)(a1 + 80) getReturnValue:&v17];
LABEL_50:
        int v16 = malloc_type_calloc(1uLL, 8uLL, 0x100004000313F17uLL);
        *(void *)int v16 = v17;
        goto LABEL_51;
      }
      uint64_t v9 = [a2 unsignedLongValue];
LABEL_49:
      uint64_t v17 = v9;
      goto LABEL_50;
    }
    if ((char)v5 == 66)
    {
      LOBYTE(v17) = 0;
      int v6 = *(void **)(a1 + 80);
      if (!v6)
      {
        char v7 = [a2 BOOLValue];
        goto LABEL_40;
      }
    }
    else
    {
      if ((char)v5 != 67) {
        return;
      }
      LOBYTE(v17) = 0;
      int v6 = *(void **)(a1 + 80);
      if (!v6)
      {
        char v7 = [a2 unsignedCharValue];
LABEL_40:
        LOBYTE(v17) = v7;
        goto LABEL_41;
      }
    }
LABEL_22:
    objc_msgSend(v6, "setArgument:atIndex:", &v18, 2, v17);
    [*(id *)(a1 + 80) invokeWithTarget:a3];
    [*(id *)(a1 + 80) getReturnValue:&v17];
LABEL_41:
    int v16 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
    *(unsigned char *)int v16 = v17;
LABEL_51:
    objc_msgSend(*(id *)(a1 + 40), "setArgument:atIndex:", v16, 2, v17);
    [*(id *)(a1 + 40) invokeWithTarget:a3];
    free(v16);
  }
}

+ (id)getValidPropertiesForType:(void *)a3 withCache:
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  self;
  int v5 = NSStringFromClass(a2);
  id v6 = (id)[a3 objectForKeyedSubscript:v5];
  if (v6) {
    return v6;
  }
  v107 = v5;
  v108 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int outCount = 0;
  double v8 = class_copyProtocolList(a2, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      LODWORD(v127.receiver) = 0;
      uint64_t v10 = protocol_copyPropertyList(v8[i], (unsigned int *)&v127);
      if (LODWORD(v127.receiver))
      {
        unint64_t v11 = 0;
        do
          objc_msgSend(v7, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", property_getName(v10[v11++])));
        while (v11 < LODWORD(v127.receiver));
      }
      free(v10);
    }
  }
  v106 = v7;
  free(v8);
  unsigned int v124 = 0;
  v12 = class_copyPropertyList(a2, &v124);
  id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
  obchar j = (id)[v13 initWithCapacity:v124];
  if (v124)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0x1EC3F4000uLL;
    int v16 = &selRef_numberWithLongLong_;
    v109 = v12;
    while (1)
    {
      uint64_t v17 = v12[v14];
      self;
      id v18 = objc_alloc((Class)(v15 + 2312));
      if (!v18) {
        goto LABEL_13;
      }
      uint64_t v19 = (objc_class *)v16[219];
      v127.receiver = v18;
      v127.super_class = v19;
      uint64_t v20 = (id *)objc_msgSendSuper2(&v127, sel_init);
      if (v20) {
        break;
      }
LABEL_112:
      v81 = v20;
      if (v81) {
        [obj addObject:v81];
      }
      if (++v14 >= (unint64_t)v124) {
        goto LABEL_119;
      }
    }
    Name = property_getName(v17);
    id v22 = (id)[NSString stringWithUTF8String:Name];
    v20[1] = v22;
    if (([v22 hasSuffix:@"Count"] & 1) == 0)
    {
      unsigned int v126 = 0;
      v23 = property_copyAttributeList(v17, &v126);
      if (v126)
      {
        uint64_t v24 = 0;
        NSUInteger v25 = v23;
        while (*v25->name != 84)
        {
          ++v24;
          ++v25;
          if (v126 == v24) {
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:
        uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v114 = v23;
      v26 = &v23[v24];
      uint64_t v27 = (void *)[NSString stringWithUTF8String:v26->value];
      v28 = v27;
      long long v29 = 0;
      int v30 = *v26->value;
      *((unsigned char *)v20 + 32) = *v26->value;
      if (v30 <= 63)
      {
        if ((v30 - 40) >= 3 && v30 != 63)
        {
LABEL_40:
          v111 = v28;
          v113 = Name;
          uint64_t v112 = objc_msgSend(v20[1], "stringByReplacingCharactersInRange:withString:", 0, 1, objc_msgSend((id)objc_msgSend(v20[1], "substringToIndex:", 1), "uppercaseString"));
          if ([v20[2] isSubclassOfClass:objc_opt_class()])
          {
            v38 = (void *)[NSString stringWithUTF8String:Name];
            for (char j = 1; ; char j = 0)
            {
              SEL v40 = sel_registerName((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@%@", v38, @"Type", "UTF8String"]);
              if (objc_opt_respondsToSelector()) {
                break;
              }
              if ((j & 1) == 0) {
                goto LABEL_49;
              }
              if ([v38 hasSuffix:@"s"]) {
                uint64_t v41 = objc_msgSend(v38, "substringToIndex:", objc_msgSend(v38, "length") - 1);
              }
              else {
                uint64_t v41 = [v38 stringByAppendingString:@"s"];
              }
              v38 = (void *)v41;
            }
            uint64_t v42 = [(objc_class *)a2 methodSignatureForSelector:v40];
            v43 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v42];
            [v43 setSelector:v40];
            [v43 invokeWithTarget:a2];
            [v43 getReturnValue:v20 + 3];
            id v44 = v20[3];
          }
LABEL_49:
          if (v126)
          {
            uint64_t v45 = 0;
            value = v113;
            v47 = v114;
            while (*v47->name != 71)
            {
              ++v45;
              ++v47;
              if (v126 == v45)
              {
                uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
                goto LABEL_56;
              }
            }
            value = v114[v45].value;
          }
          else
          {
            uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
            value = v113;
          }
LABEL_56:
          v48 = (void *)[NSString stringWithUTF8String:value];
          if (!v29) {
            long long v29 = v111;
          }
          SEL v49 = sel_registerName((const char *)[v48 UTF8String]);
          if ([(objc_class *)a2 instancesRespondToSelector:v49])
          {
            if ([v29 length])
            {
              v50 = (void *)[NSString stringWithFormat:@"%@@:", v29];
              uint64_t v51 = objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", objc_msgSend(v50, "UTF8String"));
            }
            else
            {
              uint64_t v51 = [(objc_class *)a2 instanceMethodSignatureForSelector:v49];
            }
            v52 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v51];
            [v52 setSelector:v49];
          }
          else
          {
            v52 = 0;
          }
          v20[6] = v52;
          uint64_t v53 = v126;
          v54 = v114;
          if (v126)
          {
            while (*v54->name != 83)
            {
              ++v54;
              if (!--v53) {
                goto LABEL_67;
              }
            }
            SEL v56 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v114[v45].value), "UTF8String"));
            if ([(objc_class *)a2 instancesRespondToSelector:v56])
            {
              if ([v111 length])
              {
                v57 = (void *)[NSString stringWithFormat:@"v@:%@", v111];
                uint64_t v58 = objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", objc_msgSend(v57, "UTF8String"));
              }
              else
              {
                uint64_t v58 = [(objc_class *)a2 instanceMethodSignatureForSelector:v56];
              }
              v68 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v58];
              [v68 setSelector:v56];
            }
            else
            {
              v68 = 0;
            }
            v20[5] = v68;
LABEL_92:
            SEL v69 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(v20[1], "stringByAppendingString:", @"Count"), "UTF8String"));
            if ([(objc_class *)a2 instancesRespondToSelector:v69])
            {
              v12 = v109;
              unint64_t v15 = 0x1EC3F4000;
              int v16 = &selRef_numberWithLongLong_;
              if ([0 length])
              {
                v70 = (void *)[NSString stringWithFormat:@"%@@:", 0];
                uint64_t v71 = objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", objc_msgSend(v70, "UTF8String"));
              }
              else
              {
                uint64_t v71 = [(objc_class *)a2 instanceMethodSignatureForSelector:v69];
              }
              v72 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v71];
              [v72 setSelector:v69];
            }
            else
            {
              v72 = 0;
              v12 = v109;
              unint64_t v15 = 0x1EC3F4000;
              int v16 = &selRef_numberWithLongLong_;
            }
            v20[8] = v72;
            SEL v73 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%sAsString:", v113), "UTF8String"));
            if ([(objc_class *)a2 instancesRespondToSelector:v73])
            {
              if ([0 length])
              {
                v74 = (void *)[NSString stringWithFormat:@"%@@:", 0];
                uint64_t v75 = objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", objc_msgSend(v74, "UTF8String"));
              }
              else
              {
                uint64_t v75 = [(objc_class *)a2 instanceMethodSignatureForSelector:v73];
              }
              v76 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v75];
              [v76 setSelector:v73];
            }
            else
            {
              v76 = 0;
            }
            v20[9] = v76;
            SEL v77 = sel_registerName((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"StringAs%@:", v112), "UTF8String"]);
            if ([(objc_class *)a2 instancesRespondToSelector:v77])
            {
              if ([0 length])
              {
                v78 = (void *)[NSString stringWithFormat:@"%@@:", 0];
                uint64_t v79 = objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", objc_msgSend(v78, "UTF8String"));
              }
              else
              {
                uint64_t v79 = [(objc_class *)a2 instanceMethodSignatureForSelector:v77];
              }
              v80 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v79];
              [v80 setSelector:v77];
            }
            else
            {
              v80 = 0;
            }
            v20[10] = v80;
LABEL_111:
            free(v114);
            goto LABEL_112;
          }
LABEL_67:
          int v55 = *((unsigned __int8 *)v20 + 32);
          if (v55 == 64)
          {
            if (([v20[2] isSubclassOfClass:objc_opt_class()] & 1) == 0) {
              goto LABEL_75;
            }
LABEL_74:
            v59 = @"add";
          }
          else
          {
            if (v55 == 94)
            {
              long long v29 = (void *)[v29 substringFromIndex:1];
              goto LABEL_74;
            }
LABEL_75:
            v59 = @"set";
          }
          char v60 = 1;
          v61 = (void *)v112;
          while (1)
          {
            SEL v62 = sel_registerName((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@%@:", v59, v61), "UTF8String"]);
            if ([(objc_class *)a2 instancesRespondToSelector:v62])
            {
              if ([v29 length])
              {
                v63 = (void *)[NSString stringWithFormat:@"v@:%@", v29];
                uint64_t v64 = objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", objc_msgSend(v63, "UTF8String"));
              }
              else
              {
                uint64_t v64 = [(objc_class *)a2 instanceMethodSignatureForSelector:v62];
              }
              v65 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v64];
              [v65 setSelector:v62];
            }
            else
            {
              v65 = 0;
            }
            id v66 = v65;
            v20[5] = v66;
            if (v66 != 0 || (v60 & 1) == 0) {
              break;
            }
            if ([v61 hasSuffix:@"s"]) {
              uint64_t v67 = objc_msgSend(v61, "substringToIndex:", objc_msgSend(v61, "length") - 1);
            }
            else {
              uint64_t v67 = [v61 stringByAppendingString:@"s"];
            }
            v61 = (void *)v67;
            char v60 = 0;
          }
          goto LABEL_92;
        }
LABEL_33:
        NSLog(&cfstr_IgnoringProper.isa, Name, v27);
LABEL_34:
        uint64_t v20 = 0;
        int v16 = &selRef_numberWithLongLong_;
        goto LABEL_111;
      }
      if (v30 > 122)
      {
        if (v30 == 125) {
          goto LABEL_33;
        }
        if (v30 != 123) {
          goto LABEL_40;
        }
        uint64_t v34 = (uint64_t)v20;
        long long v31 = v28;
        v35 = v28;
      }
      else
      {
        if (v30 == 64)
        {
          v110 = v27;
          v37 = (void *)[v27 substringFromIndex:1];
          if ((unint64_t)[v37 length] >= 3
            && [v37 characterAtIndex:0] == 34)
          {
            v37 = objc_msgSend(v37, "substringWithRange:", 1, objc_msgSend(v37, "length") - 2);
          }
          if (([v37 hasPrefix:@"<"] & 1) == 0)
          {
            long long v29 = 0;
            v20[2] = NSClassFromString((NSString *)v37);
            v28 = v110;
            goto LABEL_40;
          }
          goto LABEL_34;
        }
        if (v30 != 94) {
          goto LABEL_40;
        }
        long long v31 = v27;
        char v32 = [v27 characterAtIndex:1];
        *((unsigned char *)v20 + 33) = v32;
        uint64_t v33 = (v32 - 66);
        int v16 = &selRef_numberWithLongLong_;
        if (v33 > 0x39) {
          goto LABEL_118;
        }
        if (((1 << (v32 - 66)) & 0x849600008481) != 0)
        {
          long long v29 = 0;
          v28 = v31;
          goto LABEL_40;
        }
        if (v33 != 57)
        {
LABEL_118:
          NSLog(&cfstr_IgnoringProper.isa, Name, v31);
          uint64_t v20 = 0;
          goto LABEL_111;
        }
        v35 = (void *)[v31 substringFromIndex:1];
        uint64_t v34 = (uint64_t)v20;
      }
      id v36 = -[_PBProperty _parseStructDefinition:](v34, v35);
      v28 = v31;
      long long v29 = v36;
      goto LABEL_40;
    }
LABEL_13:
    uint64_t v20 = 0;
    goto LABEL_112;
  }
LABEL_119:
  free(v12);
  [obj sortUsingComparator:&__block_literal_global_396];
  id v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(obj, "count"));
  id v83 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  uint64_t v84 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
  if (!v84) {
    goto LABEL_140;
  }
  uint64_t v85 = v84;
  uint64_t v86 = *(void *)v121;
  do
  {
    uint64_t v87 = 0;
    do
    {
      if (*(void *)v121 != v86) {
        objc_enumerationMutation(obj);
      }
      uint64_t v88 = *(void *)(*((void *)&v120 + 1) + 8 * v87);
      if (v88) {
        v89 = *(void **)(v88 + 8);
      }
      else {
        v89 = 0;
      }
      v90 = (void *)[v89 lowercaseString];
      if ([v90 hasPrefix:@"has"])
      {
        uint64_t v91 = [v90 substringFromIndex:3];
        uint64_t v92 = [v82 objectForKeyedSubscript:v91];
        if (v92)
        {
          uint64_t v93 = v92;
          *(void *)(v92 + 56) = *(id *)(v88 + 48);
          [v83 addObject:v93];
          v94 = v82;
          v95 = (void *)v91;
LABEL_133:
          [v94 removeObjectForKey:v95];
          goto LABEL_135;
        }
      }
      else
      {
        if (v88) {
          v96 = *(void **)(v88 + 16);
        }
        else {
          v96 = 0;
        }
        if ([v96 isSubclassOfClass:objc_opt_class()])
        {
          [v83 addObject:v88];
          v94 = v82;
          v95 = v90;
          goto LABEL_133;
        }
      }
      [v82 setObject:v88 forKeyedSubscript:v90];
LABEL_135:
      ++v87;
    }
    while (v85 != v87);
    uint64_t v97 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
    uint64_t v85 = v97;
  }
  while (v97);
LABEL_140:
  objc_msgSend(v83, "addObjectsFromArray:", objc_msgSend(v82, "allValues"));
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v83, "count"));
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v98 = [v83 countByEnumeratingWithState:&v116 objects:v128 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = *(void *)v117;
    do
    {
      uint64_t v101 = 0;
      do
      {
        if (*(void *)v117 != v100) {
          objc_enumerationMutation(v83);
        }
        v102 = *(void **)(*((void *)&v116 + 1) + 8 * v101);
        if (v102) {
          uint64_t v103 = v102[1];
        }
        else {
          uint64_t v103 = 0;
        }
        if (![v106 containsObject:v103] || v102[7] || v102[8]) {
          [v6 addObject:v102];
        }
        ++v101;
      }
      while (v99 != v101);
      uint64_t v104 = [v83 countByEnumeratingWithState:&v116 objects:v128 count:16];
      uint64_t v99 = v104;
    }
    while (v104);
  }
  [v108 setObject:v6 forKeyedSubscript:v107];
  return v6;
}

@end