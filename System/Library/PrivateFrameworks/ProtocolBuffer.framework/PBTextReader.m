@interface PBTextReader
- (PBTextReader)init;
- (id)_readString;
- (id)readMessageType:(Class)a3 fromString:(id)a4;
- (objc_class)_readObject:(uint64_t)a1;
- (uint64_t)_rangeOfCharactersInSetAtCurrentPosition:(uint64_t)a1;
- (uint64_t)_readTag:(uint64_t *)a3 andType:;
- (uint64_t)_readValue;
- (void)_parseNumber:(void *)a1 maxValue:(unint64_t)a2 isSigned:(int)a3;
- (void)dealloc;
@end

@implementation PBTextReader

- (id)readMessageType:(Class)a3 fromString:(id)a4
{
  id result = (id)[a4 length];
  if (result)
  {
    v8 = (NSString *)[a4 copy];
    self->_string = v8;
    self->_pos = 0;
    self->_length = [(NSString *)v8 length];
    v9 = -[PBTextReader _readObject:]((uint64_t)self, a3);

    self->_pos = 0;
    self->_length = 0;
    self->_string = 0;
    return v9;
  }
  return result;
}

- (objc_class)_readObject:(uint64_t)a1
{
  v128[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = a2;
  uint64_t v3 = a1;
  if (!a2)
  {
    id v5 = 0;
    while (1)
    {
      while (1)
      {
LABEL_19:
        if (*(void *)(v3 + 32) >= *(void *)(v3 + 40)) {
          return v2;
        }
        uint64_t v115 = 0;
        v116 = 0;
        -[PBTextReader _readTag:andType:](v3, (uint64_t *)&v116, &v115);
        v15 = v116;
        if ([v116 length]) {
          break;
        }
        uint64_t v17 = 0;
LABEL_26:
        switch(v115)
        {
          case 0:
            uint64_t v19 = *(void *)(v3 + 32);
            uint64_t v20 = *(void *)(a1 + 40);
            uint64_t v21 = 20;
            if (v19 > 20) {
              uint64_t v21 = v19;
            }
            if ((unint64_t)(v20 - v19) >= 0x28) {
              uint64_t v22 = 40;
            }
            else {
              uint64_t v22 = v20 - v19;
            }
            uint64_t v23 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v21 - 20, v22);
            v24 = v116;
            id v109 = -[NSString camelCase](v116);
            uint64_t v113 = v17;
            uint64_t v107 = v23;
            v108 = v24;
            uint64_t v102 = v19;
            uint64_t v103 = v20;
            uint64_t v3 = a1;
            v25 = @"read unknown tag";
            goto LABEL_33;
          case 1:
            if (!v17) {
              goto LABEL_133;
            }
            if (*(void *)(v17 + 16))
            {
              if (*(void *)(v17 + 24)) {
                uint64_t v26 = *(void *)(v17 + 24);
              }
              else {
                uint64_t v26 = *(void *)(v17 + 16);
              }
              v27 = (void *)-[PBTextReader _readObject:](v3, v26);
              if (!v27)
              {
                uint64_t v70 = *(void *)(v3 + 32);
                uint64_t v71 = *(void *)(a1 + 40);
                uint64_t v72 = 20;
                if (v70 > 20) {
                  uint64_t v72 = v70;
                }
                if ((unint64_t)(v71 - v70) >= 0x28) {
                  uint64_t v73 = 40;
                }
                else {
                  uint64_t v73 = v71 - v70;
                }
                uint64_t v74 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v72 - 20, v73);
                v75 = v116;
                id v109 = -[NSString camelCase](v116);
                uint64_t v113 = v17;
                uint64_t v107 = v74;
                v108 = v75;
                uint64_t v102 = v70;
                uint64_t v103 = v71;
                uint64_t v3 = a1;
                v25 = @"unable to parse object";
LABEL_33:
                NSLog(&cfstr_AtIITagForProp.isa, v25, v102, v103, v107, v108, v109, v113);
                continue;
              }
              v127[0] = v27;
LABEL_43:
              [*(id *)(v17 + 40) setArgument:v127 atIndex:2];
              [*(id *)(v17 + 40) invokeWithTarget:v2];
            }
            else
            {
              if (!*(void *)(v17 + 120))
              {
LABEL_133:
                uint64_t v88 = *(void *)(v3 + 32);
                uint64_t v89 = *(void *)(a1 + 40);
                uint64_t v90 = 20;
                if (v88 > 20) {
                  uint64_t v90 = v88;
                }
                if ((unint64_t)(v89 - v88) >= 0x28) {
                  uint64_t v91 = 40;
                }
                else {
                  uint64_t v91 = v89 - v88;
                }
                uint64_t v92 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v90 - 20, v91);
                v93 = v116;
                id v109 = -[NSString camelCase](v116);
                uint64_t v113 = v17;
                uint64_t v107 = v92;
                v108 = v93;
                uint64_t v102 = v88;
                uint64_t v103 = v89;
                uint64_t v3 = a1;
                v25 = @"expected object/struct type";
                goto LABEL_33;
              }
              id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              while (*(void *)(v3 + 32) < *(void *)(v3 + 40))
              {
                v127[0] = 0;
                *(void *)&long long v122 = 0;
                -[PBTextReader _readTag:andType:](v3, (uint64_t *)v127, (uint64_t *)&v122);
                switch((uint64_t)v122)
                {
                  case 0:
                    uint64_t v49 = *(void *)(v3 + 32);
                    uint64_t v50 = *(void *)(a1 + 40);
                    uint64_t v51 = 20;
                    if (v49 > 20) {
                      uint64_t v51 = v49;
                    }
                    if ((unint64_t)(v50 - v49) >= 0x28) {
                      uint64_t v52 = 40;
                    }
                    else {
                      uint64_t v52 = v50 - v49;
                    }
                    uint64_t v53 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v51 - 20, v52);
                    v54 = v127[0];
                    id v111 = -[NSString camelCase](v127[0]);
                    uint64_t v105 = v50;
                    uint64_t v3 = a1;
                    NSLog(&cfstr_AtIITagForProp.isa, @"read unrecoginzed struct tag", v49, v105, v53, v54, v111, v17);
                    continue;
                  case 1:
                    uint64_t v55 = *(void *)(v3 + 32);
                    uint64_t v56 = *(void *)(a1 + 40);
                    uint64_t v57 = 20;
                    if (v55 > 20) {
                      uint64_t v57 = v55;
                    }
                    if ((unint64_t)(v56 - v55) >= 0x28) {
                      uint64_t v58 = 40;
                    }
                    else {
                      uint64_t v58 = v56 - v55;
                    }
                    uint64_t v59 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v57 - 20, v58);
                    v60 = v127[0];
                    id v112 = -[NSString camelCase](v127[0]);
                    uint64_t v106 = v56;
                    uint64_t v3 = a1;
                    NSLog(&cfstr_AtIITagForProp.isa, @"unexpected nested tag", v55, v106, v59, v60, v112, v17);
                    continue;
                  case 2:
                  case 5:
                    goto LABEL_110;
                  case 3:
                    v61 = -[PBTextReader _readString](v3);
                    goto LABEL_89;
                  case 4:
                    v61 = (void *)-[PBTextReader _readValue](v3);
                    v62 = -[PBTextReader _parseNumber:maxValue:isSigned:](v61, 0xFFFFFFFFFFFFFFFFLL, 0);
                    if (!v62) {
                      v62 = -[PBTextReader _parseNumber:maxValue:isSigned:](v61, 0x7FFFFFFFFFFFFFFFuLL, 1);
                    }
                    if (v62) {
                      v61 = v62;
                    }
LABEL_89:
                    v63 = v127[0];
                    if (v127[0]) {
                      BOOL v64 = v61 == 0;
                    }
                    else {
                      BOOL v64 = 1;
                    }
                    if (!v64)
                    {
                      uint64_t v65 = [v48 objectForKeyedSubscript:v127[0]];
                      if (v65
                        && ((v66 = (void *)v65, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                         || (id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]),
                             [v67 addObject:v66],
                             [v48 setObject:v67 forKeyedSubscript:v63],
                             (v66 = v67) != 0)))
                      {
                        [v66 addObject:v61];
                      }
                      else
                      {
                        [v48 setObject:v61 forKeyedSubscript:v63];
                      }
                    }
                    break;
                  default:
                    continue;
                }
              }
LABEL_110:
              if (!v48)
              {
                uint64_t v94 = *(void *)(v3 + 32);
                uint64_t v95 = *(void *)(a1 + 40);
                uint64_t v96 = 20;
                if (v94 > 20) {
                  uint64_t v96 = v94;
                }
                if ((unint64_t)(v95 - v94) >= 0x28) {
                  uint64_t v97 = 40;
                }
                else {
                  uint64_t v97 = v95 - v94;
                }
                uint64_t v98 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v96 - 20, v97);
                v99 = v116;
                id v109 = -[NSString camelCase](v116);
                uint64_t v113 = v17;
                uint64_t v107 = v98;
                v108 = v99;
                uint64_t v102 = v94;
                uint64_t v103 = v95;
                uint64_t v3 = a1;
                v25 = @"unable to parse struct";
                goto LABEL_33;
              }
              if (*(void *)(v17 + 96)
                || (v76 = dlsym((void *)0xFFFFFFFFFFFFFFFELL, (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@FromDictionaryRepresentation", *(void *)(v17 + 104)), "UTF8String"]), (*(void *)(v17 + 96) = v76) != 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v128[0] = v48;
                  id v48 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:1];
                }
                long long v124 = 0u;
                long long v125 = 0u;
                long long v122 = 0u;
                long long v123 = 0u;
                uint64_t v77 = [v48 countByEnumeratingWithState:&v122 objects:v127 count:16];
                if (v77)
                {
                  uint64_t v78 = v77;
                  uint64_t v79 = *(void *)v123;
                  do
                  {
                    for (uint64_t i = 0; i != v78; ++i)
                    {
                      if (*(void *)v123 != v79) {
                        objc_enumerationMutation(v48);
                      }
                      uint64_t v81 = *(void *)(*((void *)&v122 + 1) + 8 * i);
                      id v82 = *(id *)(v17 + 120);
                      if (v82) {
                        id v82 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v82];
                      }
                      (*(void (**)(uint64_t, uint64_t))(v17 + 96))(v81, [v82 mutableBytes]);
                      v121 = 0;
                      v83 = (void *)[v82 bytes];
                      v121 = v83;
                      if (*(unsigned char *)(v17 + 32) == 94)
                      {
                        if (-[NSString hasPrefix:](NSStringFromSelector((SEL)objc_msgSend(*(id *)(v17 + 40), "selector", v83)), "hasPrefix:", @"set"))
                        {
                          v84 = *(void **)(v17 + 40);
                          v83 = &v121;
                          goto LABEL_127;
                        }
                        v83 = v121;
                      }
                      v84 = *(void **)(v17 + 40);
LABEL_127:
                      [v84 setArgument:v83 atIndex:2];
                      [*(id *)(v17 + 40) invokeWithTarget:v2];
                    }
                    uint64_t v78 = [v48 countByEnumeratingWithState:&v122 objects:v127 count:16];
                  }
                  while (v78);
                }
              }
              uint64_t v3 = a1;
            }
            break;
          case 2:
          case 5:
            return v2;
          case 3:
            id v28 = -[PBTextReader _readString](v3);
            if (!v28) {
              continue;
            }
            v127[0] = v28;
            if (!v17) {
              continue;
            }
            goto LABEL_43;
          case 4:
            v29 = (void *)-[PBTextReader _readValue](v3);
            if (![v29 length]) {
              continue;
            }
            if ([v29 characterAtIndex:0] == 48
              || (uint64_t v68 = objc_msgSend(v29, "rangeOfCharacterFromSet:", objc_msgSend(*(id *)(v3 + 24), "invertedSet")), v17)
              && *(void *)(v17 + 80)
              || v68 == 0x7FFFFFFFFFFFFFFFLL
              || (id v69 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v29 options:0], !objc_msgSend(v69, "length")))
            {
              if (v17)
              {
                if (*(void *)(v17 + 80))
                {
                  uint64_t v30 = v17;
                  v31 = v29;
LABEL_162:
                  -[_PBProperty setNumberValue:onInstance:](v30, v31, (uint64_t)v2);
                  continue;
                }
                unint64_t v85 = 0;
                int v86 = *(char *)(v17 + 32);
                char v87 = *(unsigned char *)(v17 + 32);
                if (v86 <= 98)
                {
                  if (v86 > 80)
                  {
                    if (v86 == 81)
                    {
                      unint64_t v85 = -1;
                    }
                    else if (v86 == 83)
                    {
                      unint64_t v85 = 0xFFFFLL;
                    }
                  }
                  else if (v86 == 66)
                  {
                    unint64_t v85 = 1;
                  }
                  else if (v86 == 73)
                  {
                    unint64_t v85 = 0xFFFFFFFFLL;
                  }
                }
                else
                {
                  switch(*(unsigned char *)(v17 + 32))
                  {
                    case 'c':
                      unint64_t v85 = 127;
                      break;
                    case 'd':
                    case 'f':
                      unint64_t v85 = 0;
                      break;
                    case 'e':
                    case 'g':
                    case 'h':
                      break;
                    case 'i':
                      unint64_t v85 = 0x7FFFFFFFLL;
                      break;
                    default:
                      if (v86 == 115)
                      {
                        unint64_t v85 = 0x7FFFLL;
                      }
                      else if (v86 == 113)
                      {
                        unint64_t v85 = 0x7FFFFFFFFFFFFFFFLL;
                      }
                      break;
                  }
                }
              }
              else
              {
                unint64_t v85 = 0;
                char v87 = 0;
              }
              v100 = -[PBTextReader _parseNumber:maxValue:isSigned:](v29, v85, ((v87 - 67) > 0x30) | ((0x1FFFFFFFEBFBEuLL >> (v87 - 67)) & 1));
              if (!v100) {
                continue;
              }
              v31 = v100;
              uint64_t v30 = v17;
              goto LABEL_162;
            }
            v127[0] = v69;
            if (v17) {
              goto LABEL_43;
            }
            continue;
          default:
            continue;
        }
      }
      if (![v15 length]) {
        goto LABEL_52;
      }
      id v16 = -[NSString camelCase](v15);
      uint64_t v17 = [v5 objectForKeyedSubscript:v16];
      if (v17) {
        goto LABEL_26;
      }
      uint64_t v18 = [v16 hasSuffix:@"s"]
          ? objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1)
          : [v16 stringByAppendingString:@"s"];
      uint64_t v17 = [v5 objectForKeyedSubscript:v18];
      if (v17) {
        goto LABEL_26;
      }
      v15 = v116;
LABEL_52:
      uint64_t v32 = v3;
      uint64_t v33 = *(void *)(v3 + 32);
      uint64_t v34 = *(void *)(v3 + 40);
      v35 = *(void **)(v32 + 48);
      uint64_t v36 = 20;
      if (v33 > 20) {
        uint64_t v36 = v33;
      }
      if ((unint64_t)(v34 - v33) >= 0x28) {
        uint64_t v37 = 40;
      }
      else {
        uint64_t v37 = v34 - v33;
      }
      uint64_t v38 = objc_msgSend(v35, "substringWithRange:", v36 - 20, v37);
      id v39 = -[NSString camelCase](v15);
      NSLog(&cfstr_AtIITagForProp.isa, @"read unrecoginzed tag", v33, v34, v38, v15, v39, 0);
      uint64_t v40 = a1;
      switch(v115)
      {
        case 1:
          uint64_t v41 = -[PBTextReader _readObject:](a1, 0);
          goto LABEL_62;
        case 2:
          return v2;
        case 3:
          uint64_t v41 = (uint64_t)-[PBTextReader _readString](a1);
          goto LABEL_62;
        case 4:
          uint64_t v41 = -[PBTextReader _readValue](a1);
          goto LABEL_62;
        default:
          uint64_t v41 = 0;
          uint64_t v40 = a1;
LABEL_62:
          uint64_t v42 = [NSString stringWithFormat:@"     value: %@", v41];
          uint64_t v43 = *(void *)(v40 + 32);
          uint64_t v44 = *(void *)(a1 + 40);
          uint64_t v45 = 20;
          if (v43 > 20) {
            uint64_t v45 = *(void *)(v40 + 32);
          }
          if ((unint64_t)(v44 - v43) >= 0x28) {
            uint64_t v46 = 40;
          }
          else {
            uint64_t v46 = v44 - v43;
          }
          uint64_t v47 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v45 - 20, v46);
          id v110 = -[NSString camelCase](v15);
          uint64_t v104 = v44;
          uint64_t v3 = a1;
          NSLog(&cfstr_AtIITagForProp.isa, v42, v43, v104, v47, v15, v110, 0);
          break;
      }
    }
  }
  v4 = NSStringFromClass(a2);
  id v5 = (id)[*(id *)(v3 + 56) objectForKeyedSubscript:v4];
  if (v5)
  {
LABEL_17:
    v2 = (objc_class *)objc_alloc_init(v2);
    goto LABEL_19;
  }
  id v6 = +[_PBProperty getValidPropertiesForType:withCache:]((uint64_t)_PBProperty, v2, *(void **)(v3 + 64));
  if (v6)
  {
    v7 = v6;
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v117 objects:v126 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v118;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v118 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v117 + 1) + 8 * v11);
          if (v12) {
            uint64_t v13 = *(void *)(v12 + 8);
          }
          else {
            uint64_t v13 = 0;
          }
          [v5 setObject:v12 forKeyedSubscript:v13];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v14 = [v7 countByEnumeratingWithState:&v117 objects:v126 count:16];
        uint64_t v9 = v14;
      }
      while (v14);
    }
    uint64_t v3 = a1;
    [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v4];
    goto LABEL_17;
  }
  return 0;
}

- (uint64_t)_readTag:(uint64_t *)a3 andType:
{
  uint64_t v6 = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 8));
  if (v6 == *(void *)(a1 + 32)) {
    *(void *)(a1 + 32) = v6 + v7;
  }
  uint64_t result = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 16));
  uint64_t v10 = result;
  if (result == *(void *)(a1 + 32) && v9 != 0)
  {
    *(void *)(a1 + 32) = result + v9;
    uint64_t result = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", result, v9 - (objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:", result + v9 - 1) == 58));
    *a2 = result;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t result = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 8));
    if (result == 0x7FFFFFFFFFFFFFFFLL || result == *(void *)(a1 + 32))
    {
      if (v12) {
        *(void *)(a1 + 32) = result + v12;
      }
    }
  }
  if (*(void *)(a1 + 32) >= *(void *)(a1 + 40))
  {
    uint64_t v14 = 5;
  }
  else
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:");
    switch(result)
    {
      case '""':
        uint64_t v14 = 3;
        break;
      case '}':
        uint64_t v13 = 2;
        goto LABEL_21;
      case '{':
        uint64_t v13 = 1;
LABEL_21:
        *a3 = v13;
        ++*(void *)(a1 + 32);
        return result;
      default:
        uint64_t v14 = 4;
        break;
    }
  }
  *a3 = v14;
  return result;
}

- (id)_readString
{
  if ([*(id *)(a1 + 48) characterAtIndex:*(void *)(a1 + 32)] != 34) {
    return 0;
  }
  unint64_t v2 = *(void *)(a1 + 32) + 1;
  *(void *)(a1 + 32) = v2;
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E60] indexSet];
  while (1)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v2 >= v4) {
      break;
    }
    int v5 = [*(id *)(a1 + 48) characterAtIndex:v2];
    if (v5 == 92)
    {
      if (v2 + 3 >= *(void *)(a1 + 40))
      {
        unint64_t v6 = v2 + 1;
      }
      else
      {
        unint64_t v6 = v2 + 1;
        if ([*(id *)(a1 + 48) characterAtIndex:v2 + 1] - 48 <= 9) {
          objc_msgSend(v3, "addIndexesInRange:", v2 - *(void *)(a1 + 32), 4);
        }
      }
    }
    else
    {
      if (v5 == 34)
      {
        ++v2;
        unint64_t v4 = *(void *)(a1 + 40);
        break;
      }
      unint64_t v6 = v2;
    }
    unint64_t v2 = v6 + 1;
  }
  if (v2 >= v4) {
    return 0;
  }
  *(void *)(a1 + 32) = v2 + 1;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:");
  if ([v3 count])
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__PBTextReader__readString__block_invoke;
    v10[3] = &unk_1E5D729E8;
    v10[4] = v8;
    [v3 enumerateRangesWithOptions:2 usingBlock:v10];
    return (id)[v8 copy];
  }
  return v7;
}

- (uint64_t)_readValue
{
  uint64_t v2 = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, (void *)[*(id *)(a1 + 8) invertedSet]);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40) - v4;
  }
  else
  {
    uint64_t v4 = v2;
  }
  *(void *)(a1 + 32) = v4 + v3;
  int v5 = *(void **)(a1 + 48);
  return objc_msgSend(v5, "substringWithRange:");
}

- (void)_parseNumber:(void *)a1 maxValue:(unint64_t)a2 isSigned:(int)a3
{
  unint64_t v6 = (void *)[MEMORY[0x1E4F28FE8] scannerWithString:a1];
  if ([a1 characterAtIndex:0] == 48)
  {
    if ([a1 length] == 1) {
      return &unk_1EFF83D58;
    }
    int v8 = [a1 characterAtIndex:1];
    if (v8 != 46)
    {
      if (v8 == 120 || v8 == 88)
      {
        double v13 = 0.0;
        uint64_t v7 = 0;
        if (![v6 scanHexLongLong:&v13]) {
          goto LABEL_11;
        }
        uint64_t v9 = NSNumber;
        unint64_t v10 = *(void *)&v13;
      }
      else
      {
        unint64_t v10 = strtoull((const char *)[a1 UTF8String], 0, 8);
        uint64_t v9 = NSNumber;
      }
      uint64_t v7 = (void *)[v9 numberWithUnsignedLongLong:v10];
LABEL_11:
      if (v7) {
        goto LABEL_25;
      }
    }
  }
  if ([a1 isEqualToString:@"true"])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC38];
  }
  else
  {
    if (([a1 isEqualToString:@"false"] & 1) == 0)
    {
      if ([a1 rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a3)
        {
          double v13 = 0.0;
          uint64_t v7 = 0;
          if (![v6 scanLongLong:&v13]) {
            goto LABEL_25;
          }
          uint64_t v11 = [NSNumber numberWithLongLong:*(void *)&v13];
        }
        else
        {
          double v13 = 0.0;
          uint64_t v7 = 0;
          if (![v6 scanUnsignedLongLong:&v13]) {
            goto LABEL_25;
          }
          uint64_t v11 = [NSNumber numberWithUnsignedLongLong:*(void *)&v13];
        }
      }
      else
      {
        double v13 = 0.0;
        uint64_t v7 = 0;
        if (![v6 scanDouble:&v13]) {
          goto LABEL_25;
        }
        uint64_t v11 = [NSNumber numberWithDouble:v13];
      }
      uint64_t v7 = (void *)v11;
      goto LABEL_25;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC28];
  }
LABEL_25:
  if (a2 && [v7 unsignedLongLongValue] > a2) {
    return 0;
  }
  return v7;
}

- (uint64_t)_rangeOfCharactersInSetAtCurrentPosition:(uint64_t)a1
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 48), "rangeOfCharacterFromSet:options:range:", a2, 0, *(void *)(a1 + 32), *(void *)(a1 + 40) - *(void *)(a1 + 32));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(*(id *)(a1 + 48), "rangeOfCharacterFromSet:options:range:", objc_msgSend(a2, "invertedSet"), 0, v4, *(void *)(a1 + 40) - v4);
  }
  return v4;
}

uint64_t __27__PBTextReader__readString__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 2;
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA58] dataWithCapacity:a3 >> 2];
  if (a3 >= 4)
  {
    uint64_t v8 = a2 + 1;
    if (v6 <= 1) {
      unint64_t v6 = 1;
    }
    do
    {
      uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v8, 3), "UTF8String");
      char v11 = 0;
      char v11 = strtol(v9, 0, 8);
      [v7 appendBytes:&v11 length:1];
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a2, a3, (id)objc_msgSend([NSString alloc], "initWithData:encoding:", v7, 4));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PBTextReader;
  [(PBTextReader *)&v3 dealloc];
}

- (PBTextReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBTextReader;
  uint64_t v2 = [(PBTextReader *)&v6 init];
  if (v2)
  {
    v2->_whitespaceAndNewlineCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    objc_msgSend(v3, "addCharactersInRange:", 97, 26);
    objc_msgSend(v3, "addCharactersInRange:", 65, 26);
    objc_msgSend(v3, "addCharactersInRange:", 48, 10);
    [v3 addCharactersInString:@"_:"];
    v2->_tagNameCharacterSet = (NSCharacterSet *)[v3 copy];
    id v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "decimalDigitCharacterSet"), "mutableCopy");
    [v4 addCharactersInString:@"."];
    v2->_nonHexDigitCharacterSet = (NSCharacterSet *)[v4 copy];
    v2->_objects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_cachedObjectTypes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

@end