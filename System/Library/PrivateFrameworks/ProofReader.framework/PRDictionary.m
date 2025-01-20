@interface PRDictionary
- (BOOL)checkWordBuffer:(char *)a3 length:(unint64_t)a4 encoding:(unsigned int)a5 index:(unint64_t)a6 caseInsensitive:(BOOL)a7;
- (PRDictionary)initWithURL:(id)a3 fallbackURL:(id)a4;
- (id)description;
- (id)dictionaryAtIndex:(unint64_t)a3;
- (id)fallbackDictionary;
- (id)parameterBundle;
- (id)transformerParameterBundle;
- (void)dealloc;
@end

@implementation PRDictionary

- (PRDictionary)initWithURL:(id)a3 fallbackURL:(id)a4
{
  v7 = (void *)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:8 error:0];
  v8 = (unsigned char *)[v7 bytes];
  unint64_t v9 = [v7 length];
  if (v9 >= 0x404 && *v8 == 104 && v8[1] == 177 && v8[2] == 77 && v8[3] == 28)
  {
    unint64_t v10 = v9;
    v30.receiver = self;
    v30.super_class = (Class)PRDictionary;
    self = [(PRDictionary *)&v30 init];
    if (self)
    {
      v29 = (void *)[MEMORY[0x263EFF9A0] dictionary];
      v28 = (void *)[MEMORY[0x263EFF9A0] dictionary];
      v27 = (void *)[MEMORY[0x263EFF9A0] dictionary];
      for (uint64_t i = 128; i != 64; --i)
      {
        unsigned int v12 = *(_DWORD *)&v8[4 * i];
        unint64_t v13 = bswap32(v12);
        if (v12) {
          BOOL v14 = v10 > v13;
        }
        else {
          BOOL v14 = 0;
        }
        if (v14)
        {
          uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8[v13] length:v10 - v13];
          uint64_t v16 = [MEMORY[0x263F08AC0] propertyListWithData:v15 options:0 format:0 error:0];
          if (v16)
          {
            uint64_t v17 = v16;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v27, "setObject:forKey:", v17, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", i - 65));
            }
          }
          unint64_t v10 = v13;
        }
      }
      uint64_t v18 = 64;
      do
      {
        unsigned int v19 = *(_DWORD *)&v8[4 * v18];
        unint64_t v20 = bswap32(v19);
        if (v19) {
          BOOL v21 = v10 > v20;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21)
        {
          uint64_t v22 = [NSNumber numberWithUnsignedInteger:v20];
          objc_msgSend(v29, "setObject:forKey:", v22, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v18 - 1));
          uint64_t v23 = [NSNumber numberWithUnsignedInteger:(v10 - v20) >> 2];
          objc_msgSend(v28, "setObject:forKey:", v23, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v18 - 1));
          unint64_t v10 = v20;
        }
        --v18;
      }
      while (v18);
      v24 = (NLParameterBundle *)objc_msgSend(v27, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 5));
      if (v24) {
        v24 = (NLParameterBundle *)[objc_alloc(MEMORY[0x263F14030]) initWithDictionaryRepresentation:v24 error:0];
      }
      v25 = (NLParameterBundle *)objc_msgSend(v27, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 6));
      if (v25) {
        v25 = (NLParameterBundle *)[objc_alloc(MEMORY[0x263F14030]) initWithDictionaryRepresentation:v25 error:0];
      }
      self->_url = (NSURL *)[a3 copy];
      self->_data = (NSData *)v7;
      self->_offsetsDictionary = (NSDictionary *)v29;
      self->_numEntriesDictionary = (NSDictionary *)v28;
      self->_dictionariesDictionary = (NSDictionary *)v27;
      self->_parameterBundle = v24;
      self->_transformerParameterBundle = v25;
      if (a4 && ([a3 isEqual:a4] & 1) == 0) {
        self->_fallbackDictionary = [[PRDictionary alloc] initWithURL:a4 fallbackURL:0];
      }
    }
  }
  return self;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PRDictionary;
  return (id)[NSString stringWithFormat:@"%@<%@>", -[PRDictionary description](&v3, sel_description), self->_url];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRDictionary;
  [(PRDictionary *)&v3 dealloc];
}

- (BOOL)checkWordBuffer:(char *)a3 length:(unint64_t)a4 encoding:(unsigned int)a5 index:(unint64_t)a6 caseInsensitive:(BOOL)a7
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  if (a4 - 1 > 0x47) {
    return 0;
  }
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a5;
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a6];
  BOOL v14 = [(NSData *)self->_data bytes];
  uint64_t v15 = &v14[objc_msgSend(-[NSDictionary objectForKey:](self->_offsetsDictionary, "objectForKey:", v13), "unsignedIntegerValue")];
  unsigned int v16 = objc_msgSend(-[NSDictionary objectForKey:](self->_numEntriesDictionary, "objectForKey:", v13), "unsignedIntegerValue");
  unsigned int v17 = v16;
  if (v15) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    if (!v7) {
      goto LABEL_36;
    }
    if ((int)v9 <= 1279)
    {
      if (v9 == 514)
      {
        v91 = v100;
        unint64_t v92 = a4;
        v93 = a3;
        do
        {
          int v95 = *v93++;
          int v94 = v95;
          unsigned int v96 = v95 - 192;
          BOOL v97 = (v95 - 65) >= 0x1A && v96 >= 0x17;
          if (!v97
            || ((v94 - 161) <= 0x3D
              ? (BOOL v98 = ((1 << (v94 + 95)) & 0x3F80000000006F35) == 0)
              : (BOOL v98 = 1),
                !v98))
          {
            char v99 = v94 + 95;
            if (v94 + 95) < 0xFu && ((0x6F35u >> v99)) {
              LOBYTE(v94) = byte_20CC619B8[v99];
            }
            else {
              LOBYTE(v94) = v94 + 32;
            }
          }
          *v91++ = v94;
          --v92;
        }
        while (v92);
        goto LABEL_37;
      }
      if (v9 == 517)
      {
        v28 = v100;
        unint64_t v29 = a4;
        objc_super v30 = a3;
        do
        {
          int v32 = *v30++;
          char v31 = v32;
          unsigned int v33 = v32 - 65;
          unsigned int v34 = v32 - 176;
          unsigned int v35 = v32 - 161;
          BOOL v36 = (v32 & 0xFE) != 0xAE && v35 >= 0xC;
          char v37 = v31 + 80;
          if (v36) {
            char v37 = v31;
          }
          char v38 = v31 + 32;
          if (v33 >= 0x1A && v34 > 0x1F) {
            char v38 = v37;
          }
          *v28++ = v38;
          --v29;
        }
        while (v29);
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    if (v9 != 1280)
    {
      if (v9 != 1284)
      {
        if (v9 == 134217984)
        {
          uint64_t v22 = v100;
          unint64_t v23 = a4;
          v24 = a3;
          do
          {
            int v26 = *v24++;
            char v25 = v26;
            char v27 = v26 + 32;
            if ((v26 - 65) < 0x1A) {
              char v25 = v27;
            }
            *v22++ = v25;
            --v23;
          }
          while (v23);
          goto LABEL_37;
        }
LABEL_36:
        memcpy(v100, a3, a4);
LABEL_37:
        if (a4 <= 0x47) {
          memset(&v100[a4], a4, (71 - a4) + 1);
        }
        int v40 = -1640531527;
        v41 = v100;
        if (a4 < 0xC)
        {
          unsigned int v44 = -1640531527;
          int v43 = -1640531527;
          unsigned int v42 = a4;
        }
        else
        {
          unsigned int v42 = a4;
          int v43 = -1640531527;
          unsigned int v44 = -1640531527;
          do
          {
            unsigned int v45 = *((_DWORD *)v41 + 1) + v44;
            unsigned int v46 = *((_DWORD *)v41 + 2) + v43;
            int v47 = (*(_DWORD *)v41 + v40 - (v45 + v46)) ^ (v46 >> 13);
            unsigned int v48 = (v45 - v46 - v47) ^ (v47 << 8);
            unsigned int v49 = (v46 - v47 - v48) ^ (v48 >> 13);
            int v50 = (v47 - v48 - v49) ^ (v49 >> 12);
            unsigned int v51 = (v48 - v49 - v50) ^ (v50 << 16);
            unsigned int v52 = (v49 - v50 - v51) ^ (v51 >> 5);
            int v40 = (v50 - v51 - v52) ^ (v52 >> 3);
            unsigned int v44 = (v51 - v52 - v40) ^ (v40 << 10);
            int v43 = (v52 - v40 - v44) ^ (v44 >> 15);
            v41 += 12;
            v42 -= 12;
          }
          while (v42 > 0xB);
        }
        unsigned int v53 = v43 + a4;
        switch(v42)
        {
          case 1u:
            goto LABEL_55;
          case 2u:
            goto LABEL_54;
          case 3u:
            goto LABEL_53;
          case 4u:
            goto LABEL_52;
          case 5u:
            goto LABEL_51;
          case 6u:
            goto LABEL_50;
          case 7u:
            goto LABEL_49;
          case 8u:
            goto LABEL_48;
          case 9u:
            goto LABEL_47;
          case 0xAu:
            goto LABEL_46;
          case 0xBu:
            v53 += v41[10] << 24;
LABEL_46:
            v53 += v41[9] << 16;
LABEL_47:
            v53 += v41[8] << 8;
LABEL_48:
            v44 += v41[7] << 24;
LABEL_49:
            v44 += v41[6] << 16;
LABEL_50:
            v44 += v41[5] << 8;
LABEL_51:
            v44 += v41[4];
LABEL_52:
            v40 += v41[3] << 24;
LABEL_53:
            v40 += v41[2] << 16;
LABEL_54:
            v40 += v41[1] << 8;
LABEL_55:
            v40 += *v41;
            break;
          default:
            break;
        }
        int v54 = (v40 - v44 - v53) ^ (v53 >> 13);
        unsigned int v55 = (v44 - v53 - v54) ^ (v54 << 8);
        unsigned int v56 = (v53 - v54 - v55) ^ (v55 >> 13);
        int v57 = (v54 - v55 - v56) ^ (v56 >> 12);
        unsigned int v58 = (v55 - v56 - v57) ^ (v57 << 16);
        unsigned int v59 = (v56 - v57 - v58) ^ (v58 >> 5);
        int v60 = (v57 - v58 - v59) ^ (v59 >> 3);
        unsigned int v61 = (v59 - v60 - ((v58 - v59 - v60) ^ (v60 << 10))) ^ (((v58 - v59 - v60) ^ (v60 << 10)) >> 15);
        unint64_t v62 = ((double)(v61 - 1) / 4294967300.0 * (double)v17);
        if (bswap32(*(_DWORD *)&v15[4 * v62]) <= v61)
        {
          do
          {
            int v64 = v62 + 1;
            if (v62 >= v17 - 1) {
              break;
            }
            unsigned int v65 = bswap32(*(_DWORD *)&v15[4 * v62++]);
          }
          while (v65 < v61);
          unsigned int v63 = bswap32(*(_DWORD *)&v15[4 * (v64 - 1)]);
        }
        else
        {
          do
          {
            unsigned int v63 = bswap32(*(_DWORD *)&v15[4 * v62]);
            BOOL v36 = v62 != 0;
            LODWORD(v62) = v62 - 1;
          }
          while (v36 && v63 > v61);
        }
        int v20 = v63 == v61;
        BOOL v66 = v63 != v61;
        if (v9 == 1280 && a6 == 7 && a4 == 4 && v66)
        {
          v67 = "AT&T";
          v68 = a3;
          size_t v69 = 4;
          goto LABEL_69;
        }
        if (a6 != 1) {
          BOOL v66 = 0;
        }
        if (v9 != 1280 || !v66) {
          return v20 != 0;
        }
        switch(a4)
        {
          case 0xDuLL:
            v67 = "vulernabipity";
            v68 = a3;
            size_t v69 = 13;
LABEL_69:
            if (!strncmp(v68, v67, v69)) {
              int v20 = 1;
            }
            return v20 != 0;
          case 0xCuLL:
            if (!strncmp(a3, "uandercommit", 0xCuLL))
            {
              int v20 = 1;
              return v20 != 0;
            }
            v70 = "knswledgable";
            v71 = a3;
            size_t v72 = 12;
            goto LABEL_150;
          case 0xAuLL:
            v70 = "deconfusep";
            v71 = a3;
            size_t v72 = 10;
LABEL_150:
            int v20 = strncmp(v71, v70, v72) == 0;
            return v20 != 0;
        }
        goto LABEL_79;
      }
      v82 = v100;
      unint64_t v83 = a4;
      v84 = a3;
      while (1)
      {
        int v86 = *v84++;
        int v85 = v86;
        unsigned int v87 = v86 - 192;
        if ((v86 - 65) >= 0x1A && v87 >= 0x17) {
          break;
        }
        if ((v85 - 138) <= 0x15 && ((1 << (v85 + 118)) & 0x200015) != 0) {
          goto LABEL_122;
        }
        if (v85 != 73) {
          goto LABEL_117;
        }
        LOBYTE(v85) = -3;
LABEL_125:
        *v82++ = v85;
        if (!--v83) {
          goto LABEL_37;
        }
      }
      if (v85 <= 215)
      {
        if ((v85 - 138) > 0x15 || ((1 << (v85 + 118)) & 0x200015) == 0) {
          goto LABEL_125;
        }
LABEL_122:
        if (v85 == 159) {
          LOBYTE(v85) = -1;
        }
        else {
          LOBYTE(v85) = v85 + 16;
        }
        goto LABEL_125;
      }
      if ((v85 - 216) >= 5)
      {
        if (v85 == 221)
        {
          LOBYTE(v85) = 105;
          goto LABEL_125;
        }
        if (v85 != 222) {
          goto LABEL_125;
        }
      }
LABEL_117:
      LOBYTE(v85) = v85 + 32;
      goto LABEL_125;
    }
    v73 = v100;
    unint64_t v74 = a4;
    v75 = a3;
    while (1)
    {
      int v77 = *v75++;
      int v76 = v77;
      unsigned int v78 = v77 - 192;
      if ((v77 - 65) >= 0x1A && v78 >= 0x17)
      {
        if ((v76 - 216) >= 7)
        {
          if ((v76 - 138) > 0x15 || ((1 << (v76 + 118)) & 0x200015) == 0) {
            goto LABEL_101;
          }
LABEL_98:
          if (v76 == 159) {
            LOBYTE(v76) = -1;
          }
          else {
            LOBYTE(v76) = v76 + 16;
          }
          goto LABEL_101;
        }
      }
      else if ((v76 - 138) <= 0x15 && ((1 << (v76 + 118)) & 0x200015) != 0)
      {
        goto LABEL_98;
      }
      LOBYTE(v76) = v76 + 32;
LABEL_101:
      *v73++ = v76;
      if (!--v74) {
        goto LABEL_37;
      }
    }
  }
  fallbackDictionary = self->_fallbackDictionary;
  if (!fallbackDictionary)
  {
LABEL_79:
    int v20 = 0;
    return v20 != 0;
  }
  int v20 = [(PRDictionary *)fallbackDictionary checkWordBuffer:a3 length:a4 encoding:v9 index:a6 caseInsensitive:v7];
  return v20 != 0;
}

- (id)dictionaryAtIndex:(unint64_t)a3
{
  id result = -[NSDictionary objectForKey:](self->_dictionariesDictionary, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:"));
  if (!result)
  {
    fallbackDictionary = self->_fallbackDictionary;
    return [(PRDictionary *)fallbackDictionary dictionaryAtIndex:a3];
  }
  return result;
}

- (id)fallbackDictionary
{
  return self->_fallbackDictionary;
}

- (id)parameterBundle
{
  if (self->_parameterBundle) {
    return self->_parameterBundle;
  }
  else {
    return [(PRDictionary *)self->_fallbackDictionary parameterBundle];
  }
}

- (id)transformerParameterBundle
{
  if (self->_transformerParameterBundle) {
    return self->_transformerParameterBundle;
  }
  else {
    return [(PRDictionary *)self->_fallbackDictionary transformerParameterBundle];
  }
}

@end