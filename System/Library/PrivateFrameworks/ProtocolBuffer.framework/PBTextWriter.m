@interface PBTextWriter
- (BOOL)write:(id)a3;
- (PBTextWriter)init;
- (id)string;
- (uint64_t)_printLine:(uint64_t)a3 format:(uint64_t)a4;
- (uint64_t)_write:(uint64_t)a1;
- (uint64_t)_writeResult:(uint64_t)a3 forProperty:(uint64_t)a4 bracePrefix:(uint64_t)a5;
- (void)dealloc;
- (void)reset;
@end

@implementation PBTextWriter

- (BOOL)write:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self && !self->_newlinesPrinted)
  {
    [(NSMutableString *)self->_dest appendString:@"\n"];
    self->_newlinesPrinted = 1;
  }
  return -[PBTextWriter _write:]((uint64_t)self, (uint64_t)a3);
}

- (uint64_t)_write:(uint64_t)a1
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  unsigned int v68 = v3;
  if (!v2)
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = +[_PBProperty getValidPropertiesForType:withCache:]((uint64_t)_PBProperty, v6, *(void **)(a1 + 32));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v8)
    {
      uint64_t v13 = v8;
      uint64_t v14 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v71 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          if (v16)
          {
            v17 = *(void **)(v16 + 56);
            if (v17)
            {
              v18 = (char *)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 56), "methodSignature"), "methodReturnType");
              v19 = 0;
              int v20 = *v18;
              if (v20 <= 80)
              {
                if (v20 > 72)
                {
                  if (v20 == 73)
                  {
                    LODWORD(v75) = 0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[NSNumber numberWithUnsignedInt:LODWORD(v75)];
                  }
                  else if (v20 == 76)
                  {
                    double v75 = 0.0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[NSNumber numberWithUnsignedLong:*(void *)&v75];
                  }
                }
                else if (v20 == 66)
                {
                  LOBYTE(v75) = 0;
                  [v17 invokeWithTarget:a2];
                  [v17 getReturnValue:&v75];
                  v19 = (void *)[NSNumber numberWithBool:LOBYTE(v75)];
                }
                else if (v20 == 67)
                {
                  LOBYTE(v75) = 0;
                  [v17 invokeWithTarget:a2];
                  [v17 getReturnValue:&v75];
                  v19 = (void *)[NSNumber numberWithUnsignedChar:LOBYTE(v75)];
                }
              }
              else
              {
                switch(v20)
                {
                  case 'c':
                    LOBYTE(v75) = 0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[NSNumber numberWithChar:SLOBYTE(v75)];
                    break;
                  case 'd':
                    double v75 = 0.0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[NSNumber numberWithDouble:v75];
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
                    break;
                  case 'f':
                    LODWORD(v75) = 0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    LODWORD(v21) = LODWORD(v75);
                    v19 = (void *)[NSNumber numberWithFloat:v21];
                    break;
                  case 'i':
                    LODWORD(v75) = 0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[NSNumber numberWithInt:LODWORD(v75)];
                    break;
                  case 'l':
                    double v75 = 0.0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[NSNumber numberWithLong:*(void *)&v75];
                    break;
                  case 'q':
                    double v75 = 0.0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[NSNumber numberWithLongLong:*(void *)&v75];
                    break;
                  case 's':
                    LOWORD(v75) = 0;
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[NSNumber numberWithShort:SLOWORD(v75)];
                    break;
                  default:
                    if (v20 == 81)
                    {
                      double v75 = 0.0;
                      [v17 invokeWithTarget:a2];
                      [v17 getReturnValue:&v75];
                      v19 = (void *)[NSNumber numberWithUnsignedLongLong:*(void *)&v75];
                    }
                    else if (v20 == 83)
                    {
                      LOWORD(v75) = 0;
                      [v17 invokeWithTarget:a2];
                      [v17 getReturnValue:&v75];
                      v19 = (void *)[NSNumber numberWithUnsignedShort:LOWORD(v75)];
                    }
                    break;
                }
              }
              if ([v19 BOOLValue])
              {
LABEL_41:
                int v22 = *(unsigned __int8 *)(v16 + 32);
                if (v22 == 64)
                {
                  if ([*(id *)(v16 + 16) isSubclassOfClass:objc_opt_class()])
                  {
                    [(PBTextWriter *)a1 _printLine:@"%@: {", v23, v9, v10, v11, v12, *(void *)(v16 + 8) format];
                    ++*(void *)(a1 + 16);
                    double v75 = 0.0;
                    [*(id *)(v16 + 48) invokeWithTarget:a2];
                    [*(id *)(v16 + 48) getReturnValue:&v75];
                    -[PBTextWriter _write:](a1, *(void *)&v75);
                    --*(void *)(a1 + 16);
                    [(PBTextWriter *)a1 _printLine:@"}", v24, v25, v26, v27, v28, v67 format];
                    continue;
                  }
                  int v22 = *(unsigned __int8 *)(v16 + 32);
                }
                if (v22 != 123)
                {
                  if (v22 == 94)
                  {
                    if (*(unsigned char *)(v16 + 33) == 123) {
                      goto LABEL_48;
                    }
                    uint64_t v41 = -[_PBProperty getCountOfRepeatedValuesFromInstance:](v16, a2);
                    if (v41)
                    {
                      uint64_t v42 = v41;
                      double v37 = 0.0;
                      int v43 = *(char *)(v16 + 33);
                      if (v43 <= 80)
                      {
                        if (v43 > 72)
                        {
                          if (v43 == 73)
                          {
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (uint64_t j = 0; j != v42; ++j)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(void *)&v75 + 4 * j)));
                          }
                          else if (v43 == 76)
                          {
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (uint64_t k = 0; k != v42; ++k)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(*(void *)&v75 + 8 * k)));
                          }
                        }
                        else if (v43 == 66)
                        {
                          double v75 = 0.0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                          for (uint64_t m = 0; m != v42; ++m)
                            objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(*(void *)&v75 + m)));
                        }
                        else if (v43 == 67)
                        {
                          double v75 = 0.0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                          for (uint64_t n = 0; n != v42; ++n)
                            objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)(*(void *)&v75 + n)));
                        }
                      }
                      else
                      {
                        switch(*(unsigned char *)(v16 + 33))
                        {
                          case 'c':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (iuint64_t i = 0; ii != v42; ++ii)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithChar:", *(char *)(*(void *)&v75 + ii)));
                            break;
                          case 'd':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (juint64_t j = 0; jj != v42; ++jj)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(*(void *)&v75 + 8 * jj)));
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
                            break;
                          case 'f':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (kuint64_t k = 0; kk != v42; ++kk)
                            {
                              LODWORD(v58) = *(_DWORD *)(*(void *)&v75 + 4 * kk);
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v58));
                            }
                            break;
                          case 'i':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (muint64_t m = 0; mm != v42; ++mm)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(*(void *)&v75 + 4 * mm)));
                            break;
                          case 'l':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (nuint64_t n = 0; nn != v42; ++nn)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithLong:", *(void *)(*(void *)&v75 + 8 * nn)));
                            break;
                          case 'q':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (uint64_t i1 = 0; i1 != v42; ++i1)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithLongLong:", *(void *)(*(void *)&v75 + 8 * i1)));
                            break;
                          case 's':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                            for (uint64_t i2 = 0; i2 != v42; ++i2)
                              objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithShort:", *(__int16 *)(*(void *)&v75 + 2 * i2)));
                            break;
                          default:
                            if (v43 == 81)
                            {
                              double v75 = 0.0;
                              [*(id *)(v16 + 48) invokeWithTarget:a2];
                              [*(id *)(v16 + 48) getReturnValue:&v75];
                              double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                              for (uint64_t i3 = 0; i3 != v42; ++i3)
                                objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(*(void *)&v75 + 8 * i3)));
                            }
                            else if (v43 == 83)
                            {
                              double v75 = 0.0;
                              [*(id *)(v16 + 48) invokeWithTarget:a2];
                              [*(id *)(v16 + 48) getReturnValue:&v75];
                              double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v42]);
                              for (uint64_t i4 = 0; i4 != v42; ++i4)
                                objc_msgSend(*(id *)&v37, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(*(void *)&v75 + 2 * i4)));
                            }
                            break;
                        }
                      }
LABEL_156:
                      uint64_t v45 = a1;
                      double v46 = v37;
                      uint64_t v47 = v16;
                      uint64_t v48 = 0;
LABEL_157:
                      -[PBTextWriter _writeResult:forProperty:bracePrefix:](v45, *(void **)&v46, v47, v48, v9, v10, v11, v12, v66);
                      continue;
                    }
LABEL_85:
                    double v37 = 0.0;
                    goto LABEL_156;
                  }
                  uint64_t v36 = ((char)v22 - 64);
                  if (v36 > 0x33) {
                    continue;
                  }
                  if (((1 << (v22 - 64)) & 0xA1258000A120CLL) != 0)
                  {
                    double v37 = 0.0;
                    if ((char)v22 > 80)
                    {
                      switch((char)v22)
                      {
                        case 'c':
                          LOBYTE(v74) = 0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v74];
                          v38 = *(void **)(v16 + 72);
                          if (v38) {
                            goto LABEL_117;
                          }
                          *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithChar:SLOBYTE(v74)]);
                          goto LABEL_155;
                        case 'd':
                          double v75 = 0.0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          v49 = *(void **)(v16 + 72);
                          if (v49) {
                            goto LABEL_120;
                          }
                          *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithDouble:v75]);
                          goto LABEL_155;
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
                          goto LABEL_156;
                        case 'f':
                          LODWORD(v74) = 0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v74];
                          v38 = *(void **)(v16 + 72);
                          if (v38) {
                            goto LABEL_117;
                          }
                          LODWORD(v53) = LODWORD(v74);
                          *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithFloat:v53]);
                          goto LABEL_155;
                        case 'i':
                          LODWORD(v74) = 0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v74];
                          v38 = *(void **)(v16 + 72);
                          if (v38) {
                            goto LABEL_117;
                          }
                          *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithInt:LODWORD(v74)]);
                          goto LABEL_155;
                        case 'l':
                          double v75 = 0.0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          v49 = *(void **)(v16 + 72);
                          if (v49) {
                            goto LABEL_120;
                          }
                          *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithLong:*(void *)&v75]);
                          goto LABEL_155;
                        case 'q':
                          double v75 = 0.0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          v49 = *(void **)(v16 + 72);
                          if (v49) {
                            goto LABEL_120;
                          }
                          *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithLongLong:*(void *)&v75]);
                          goto LABEL_155;
                        case 's':
                          LOWORD(v74) = 0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v74];
                          v38 = *(void **)(v16 + 72);
                          if (v38) {
                            goto LABEL_117;
                          }
                          *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithShort:SLOWORD(v74)]);
                          goto LABEL_155;
                        default:
                          if ((char)v22 != 81)
                          {
                            if ((char)v22 != 83) {
                              goto LABEL_156;
                            }
                            LOWORD(v74) = 0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v74];
                            v38 = *(void **)(v16 + 72);
                            if (!v38)
                            {
                              *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithUnsignedShort:LOWORD(v74)]);
                              goto LABEL_155;
                            }
                            goto LABEL_117;
                          }
                          double v75 = 0.0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          v49 = *(void **)(v16 + 72);
                          if (v49) {
                            goto LABEL_120;
                          }
                          *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithUnsignedLongLong:*(void *)&v75]);
                          break;
                      }
                      goto LABEL_155;
                    }
                    if ((char)v22 > 72)
                    {
                      if ((char)v22 != 73)
                      {
                        if ((char)v22 != 76) {
                          goto LABEL_156;
                        }
                        double v75 = 0.0;
                        [*(id *)(v16 + 48) invokeWithTarget:a2];
                        [*(id *)(v16 + 48) getReturnValue:&v75];
                        v49 = *(void **)(v16 + 72);
                        if (v49)
                        {
LABEL_120:
                          [v49 setArgument:&v75 atIndex:2];
                          [*(id *)(v16 + 72) invokeWithTarget:a2];
                          double v74 = 0.0;
                          [*(id *)(v16 + 72) getReturnValue:&v74];
                          double v37 = v74;
                          goto LABEL_156;
                        }
                        *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithUnsignedLong:*(void *)&v75]);
                        goto LABEL_155;
                      }
                      LODWORD(v74) = 0;
                      [*(id *)(v16 + 48) invokeWithTarget:a2];
                      [*(id *)(v16 + 48) getReturnValue:&v74];
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithUnsignedInt:LODWORD(v74)]);
                        goto LABEL_155;
                      }
                    }
                    else if ((char)v22 == 66)
                    {
                      LOBYTE(v74) = 0;
                      [*(id *)(v16 + 48) invokeWithTarget:a2];
                      [*(id *)(v16 + 48) getReturnValue:&v74];
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithBool:LOBYTE(v74)]);
                        goto LABEL_155;
                      }
                    }
                    else
                    {
                      if ((char)v22 != 67) {
                        goto LABEL_156;
                      }
                      LOBYTE(v74) = 0;
                      [*(id *)(v16 + 48) invokeWithTarget:a2];
                      [*(id *)(v16 + 48) getReturnValue:&v74];
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&uint64_t v39 = COERCE_DOUBLE([NSNumber numberWithUnsignedChar:LOBYTE(v74)]);
LABEL_155:
                        double v37 = *(double *)&v39;
                        goto LABEL_156;
                      }
                    }
LABEL_117:
                    [v38 setArgument:&v74 atIndex:2];
                    [*(id *)(v16 + 72) invokeWithTarget:a2];
                    double v75 = 0.0;
                    v52 = *(void **)(v16 + 72);
                  }
                  else
                  {
                    if ((char)v22 != 64)
                    {
                      if (v36 != 30) {
                        continue;
                      }
                      goto LABEL_85;
                    }
                    double v75 = 0.0;
                    [*(id *)(v16 + 48) invokeWithTarget:a2];
                    v52 = *(void **)(v16 + 48);
                  }
                  [v52 getReturnValue:&v75];
                  double v37 = v75;
                  goto LABEL_156;
                }
LABEL_48:
                int v29 = [*(id *)(v16 + 8) hasSuffix:@"s"];
                v30 = *(void **)(v16 + 8);
                if (v29) {
                  v30 = objc_msgSend(v30, "substringToIndex:", objc_msgSend(*(id *)(v16 + 8), "length") - 1);
                }
                if (!*(void *)(v16 + 88))
                {
                  uint64_t v66 = *(void *)(v16 + 104);
                  v31 = dlsym((void *)0xFFFFFFFFFFFFFFFELL, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@DictionaryRepresentation", "UTF8String"]);
                  *(void *)(v16 + 88) = v31;
                  if (!v31) {
                    goto LABEL_72;
                  }
                }
                if (*(unsigned char *)(v16 + 32) != 94)
                {
                  id v40 = *(id *)(v16 + 120);
                  if (v40) {
                    id v40 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v40];
                  }
                  [*(id *)(v16 + 48) invokeWithTarget:a2];
                  objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", objc_msgSend(v40, "mutableBytes"));
                  id v34 = (id)(*(uint64_t (**)(uint64_t))(v16 + 88))([v40 bytes]);
                  goto LABEL_73;
                }
                uint64_t v32 = -[_PBProperty getCountOfRepeatedValuesFromInstance:](v16, a2);
                if (v32)
                {
                  uint64_t v33 = v32;
                  double v75 = 0.0;
                  [*(id *)(v16 + 48) invokeWithTarget:a2];
                  [*(id *)(v16 + 48) getReturnValue:&v75];
                  id v34 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v33];
                  double v35 = v75;
                  do
                  {
                    [v34 addObject:(*(uint64_t (**)(double))(v16 + 88))(COERCE_DOUBLE(*(void *)&v35))];
                    *(void *)&double v35 = *(void *)&v75 + *(void *)(v16 + 120);
                    double v75 = v35;
                    --v33;
                  }
                  while (v33);
                }
                else
                {
LABEL_72:
                  id v34 = 0;
                }
LABEL_73:
                uint64_t v45 = a1;
                double v46 = *(double *)&v34;
                uint64_t v47 = v16;
                uint64_t v48 = (uint64_t)v30;
                goto LABEL_157;
              }
            }
            else if (!*(void *)(v16 + 64) {
                   || -[_PBProperty getCountOfRepeatedValuesFromInstance:](*(void *)(*((void *)&v70 + 1) + 8 * i), a2))
            }
            {
              goto LABEL_41;
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v13);
    }
  }
  return v68;
}

- (uint64_t)_printLine:(uint64_t)a3 format:(uint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v9 = result;
    *(unsigned char *)(result + 8) = 0;
    int v22 = &a9;
    id v10 = (id)[[NSString alloc] initWithFormat:a3 arguments:&a9];
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (*(uint64_t *)(v9 + 16) >= 1)
    {
      uint64_t v12 = 0;
      do
      {
        [v11 appendString:@"    "];
        ++v12;
      }
      while (*(void *)(v9 + 16) > v12);
    }
    uint64_t v13 = objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "newlineCharacterSet"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    result = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (result)
    {
      uint64_t v14 = result;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v16);
          [*(id *)(v9 + 24) appendString:v11];
          [*(id *)(v9 + 24) appendString:v17];
          [*(id *)(v9 + 24) appendString:@"\n"];
          ++v16;
        }
        while (v14 != v16);
        result = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
        uint64_t v14 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_writeResult:(uint64_t)a3 forProperty:(uint64_t)a4 bracePrefix:(uint64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return result;
  }
  uint64_t v12 = result;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3)
    {
      uint64_t v18 = *(void *)(a3 + 8);
      if (*(unsigned char *)(a3 + 32) == 64) {
        return [(PBTextWriter *)v12 _printLine:@"%@: \"%@\"", v13, v14, v15, v16, v17, *(void *)(a3 + 8) format];
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    result = [a2 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (result)
    {
      uint64_t v19 = result;
      uint64_t v20 = *(void *)v37;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(a2);
          }
          -[PBTextWriter _writeResult:forProperty:bracePrefix:](v12, *(void *)(*((void *)&v36 + 1) + 8 * v21++), a3, a4);
        }
        while (v19 != v21);
        result = [a2 countByEnumeratingWithState:&v36 objects:v40 count:16];
        uint64_t v19 = result;
      }
      while (result);
    }
    return result;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a3) {
        a3 = *(void *)(a3 + 8);
      }
      uint64_t v34 = a3;
      [a2 base64EncodedStringWithOptions:0];
      goto LABEL_31;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a3)
    {
      uint64_t v18 = *(void *)(a3 + 8);
      if (isKindOfClass)
      {
LABEL_26:
        [(PBTextWriter *)v12 _printLine:@"%@: {", v13, v14, v15, v16, v17, v18 format];
        ++*(void *)(v12 + 16);
        -[PBTextWriter _write:](v12, a2);
        --*(void *)(v12 + 16);
        return [(PBTextWriter *)v12 _printLine:@"}", v29, v30, v31, v32, v33, a9 format];
      }
    }
    else
    {
      uint64_t v18 = 0;
      if (isKindOfClass) {
        goto LABEL_26;
      }
    }
LABEL_30:
    uint64_t v34 = v18;
LABEL_31:
    uint64_t v27 = @"%@: %@";
    return -[PBTextWriter _printLine:format:](v12, 0, (uint64_t)v27, v13, v14, v15, v16, v17, v34);
  }
  if (a4)
  {
    [(PBTextWriter *)v12 _printLine:@"%@ {", v22, v23, v24, v25, v26, a4 format];
    ++*(void *)(v12 + 16);
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __53__PBTextWriter__writeResult_forProperty_bracePrefix___block_invoke;
  v35[3] = &unk_1E5D729C0;
  v35[4] = v12;
  result = [a2 enumerateKeysAndObjectsUsingBlock:v35];
  if (a4)
  {
    --*(void *)(v12 + 16);
    uint64_t v27 = @"}";
    return -[PBTextWriter _printLine:format:](v12, 0, (uint64_t)v27, v13, v14, v15, v16, v17, v34);
  }
  return result;
}

uint64_t __53__PBTextWriter__writeResult_forProperty_bracePrefix___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = @"%@: \"%@\"";
  }
  else {
    uint64_t v9 = @"%@: %@";
  }
  return -[PBTextWriter _printLine:format:](*(void *)(a1 + 32), 0, (uint64_t)v9, v4, v5, v6, v7, v8, a2);
}

- (void)reset
{
  self->_dest = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  self->_newlinesPrinted = 1;
}

- (id)string
{
  BOOL v2 = (void *)[(NSMutableString *)self->_dest copy];
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PBTextWriter;
  [(PBTextWriter *)&v3 dealloc];
}

- (PBTextWriter)init
{
  v4.receiver = self;
  v4.super_class = (Class)PBTextWriter;
  BOOL v2 = [(PBTextWriter *)&v4 init];
  if (v2)
  {
    v2->_dest = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v2->_newlinesPrinted = 1;
    v2->_cachedObjectTypes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

@end