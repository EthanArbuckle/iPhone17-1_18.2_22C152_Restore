@interface SSPaymentSheetRatingImage
- (BOOL)isServerSupplied;
- (BOOL)tint;
- (NSString)urlString;
- (NSString)value;
- (SSPaymentSheetRatingImage)initWithDictionary:(id)a3;
- (SSPaymentSheetRatingImage)initWithURLString:(id)a3;
- (SSPaymentSheetRatingImage)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)localAssetName;
- (int64_t)_ratingTypeForType:(id)a3;
- (int64_t)ratingType;
@end

@implementation SSPaymentSheetRatingImage

- (SSPaymentSheetRatingImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SSPaymentSheetRatingImage;
  v5 = [(SSPaymentSheetRatingImage *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    v5->_ratingType = [(SSPaymentSheetRatingImage *)v5 _ratingTypeForType:v6];
    v7 = [v4 objectForKeyedSubscript:@"value"];
    v8 = [v7 uppercaseString];
    uint64_t v9 = [v8 copy];
    value = v5->_value;
    v5->_value = (NSString *)v9;
  }
  return v5;
}

- (SSPaymentSheetRatingImage)initWithURLString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSPaymentSheetRatingImage;
  v5 = [(SSPaymentSheetRatingImage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    v5->_ratingType = 1;
  }

  return v5;
}

- (BOOL)isServerSupplied
{
  return self->_ratingType == 1;
}

- (id)localAssetName
{
  switch(self->_ratingType)
  {
    case 3:
      if ([(NSString *)self->_value isEqualToString:@"10"])
      {
        id result = @"Rating-Brazil_10";
      }
      else if ([(NSString *)self->_value isEqualToString:@"12"])
      {
        id result = @"Rating-Brazil_12";
      }
      else if ([(NSString *)self->_value isEqualToString:@"14"])
      {
        id result = @"Rating-Brazil_14";
      }
      else if ([(NSString *)self->_value isEqualToString:@"16"])
      {
        id result = @"Rating-Brazil_16";
      }
      else
      {
        if (![(NSString *)self->_value isEqualToString:@"18"])
        {
          BOOL v5 = [(NSString *)self->_value isEqualToString:@"L"];
          uint64_t v6 = @"Rating-Brazil_L";
          goto LABEL_20;
        }
        id result = @"Rating-Brazil_18";
      }
      break;
    case 4:
      p_value = &self->_value;
      if ([(NSString *)self->_value isEqualToString:@"G"])
      {
        id result = @"Rating-MPAA_G";
      }
      else
      {
        if ([(NSString *)*p_value isEqualToString:@"GP"]) {
          goto LABEL_26;
        }
        if ([(NSString *)*p_value isEqualToString:@"PG"])
        {
          id result = @"Rating-MPAA_PG";
        }
        else if ([(NSString *)*p_value isEqualToString:@"PG-13"])
        {
          id result = @"Rating-MPAA_PG13";
        }
        else
        {
          if ([(NSString *)*p_value isEqualToString:@"M"]) {
            goto LABEL_26;
          }
          if ([(NSString *)*p_value isEqualToString:@"R"])
          {
            id result = @"Rating-MPAA_R";
          }
          else if ([(NSString *)*p_value isEqualToString:@"NC-17"])
          {
            id result = @"Rating-MPAA_NC17";
          }
          else if ([(NSString *)*p_value isEqualToString:@"UNRATED"])
          {
            id result = @"Rating-MPAA_Unrated";
          }
          else
          {
            if (![(NSString *)*p_value isEqualToString:@"NR"])
            {
              objc_super v9 = @"X";
              goto LABEL_97;
            }
            id result = @"Rating-MPAA_NR";
          }
        }
      }
      break;
    case 5:
      if (![(NSString *)self->_value isEqualToString:@"CLEAN"])
      {
        BOOL v5 = [(NSString *)self->_value isEqualToString:@"EXPLICIT"];
        uint64_t v6 = @"Rating-RIAA_Explicit";
        goto LABEL_20;
      }
      id result = @"Rating-RIAA_Clean";
      break;
    case 6:
      p_value = &self->_value;
      if ([(NSString *)self->_value isEqualToString:@"G"])
      {
        id result = @"Rating-Movie_NZ_G";
      }
      else if ([(NSString *)*p_value isEqualToString:@"PG"])
      {
        id result = @"Rating-Movie_NZ_PG";
      }
      else if ([(NSString *)*p_value isEqualToString:@"M"])
      {
        id result = @"Rating-Movie_NZ_M";
      }
      else if ([(NSString *)*p_value isEqualToString:@"R13"])
      {
        id result = @"Rating-Movie_NZ_R13";
      }
      else if ([(NSString *)*p_value isEqualToString:@"R15"])
      {
        id result = @"Rating-Movie_NZ_R15";
      }
      else if ([(NSString *)*p_value isEqualToString:@"R16"])
      {
        id result = @"Rating-Movie_NZ_R16";
      }
      else if ([(NSString *)*p_value isEqualToString:@"R18"])
      {
        id result = @"Rating-Movie_NZ_R18";
      }
      else if ([(NSString *)*p_value isEqualToString:@"RP13"])
      {
        id result = @"Rating-Movie_NZ_RP13";
      }
      else if ([(NSString *)*p_value isEqualToString:@"RP16"])
      {
        id result = @"Rating-Movie_NZ_RP16";
      }
      else
      {
        if (![(NSString *)*p_value isEqualToString:@"R"])
        {
          v7 = *p_value;
          v8 = @"NOT RATED";
          goto LABEL_95;
        }
        id result = @"Rating-Movie_NZ_R";
      }
      break;
    case 7:
      p_value = &self->_value;
      if ([(NSString *)self->_value isEqualToString:@"U"])
      {
        id result = @"Rating-Movie_UK_U";
      }
      else
      {
        if ([(NSString *)*p_value isEqualToString:@"Uc"]) {
          goto LABEL_26;
        }
        if ([(NSString *)*p_value isEqualToString:@"PG"])
        {
          id result = @"Rating-Movie_UK_PG";
        }
        else if ([(NSString *)*p_value isEqualToString:@"12"])
        {
          id result = @"Rating-Movie_UK_12";
        }
        else if ([(NSString *)*p_value isEqualToString:@"12A"])
        {
          id result = @"Rating-Movie_UK_12A";
        }
        else if ([(NSString *)*p_value isEqualToString:@"15"])
        {
          id result = @"Rating-Movie_UK_15";
        }
        else if ([(NSString *)*p_value isEqualToString:@"18"])
        {
          id result = @"Rating-Movie_UK_18";
        }
        else
        {
          if (![(NSString *)*p_value isEqualToString:@"18R"])
          {
            if (![(NSString *)*p_value isEqualToString:@"E"])
            {
              v7 = *p_value;
              v8 = @"TBC";
LABEL_95:
              if (![(NSString *)v7 isEqualToString:v8])
              {
                objc_super v9 = @"UNRATED";
LABEL_97:
                [(NSString *)*p_value isEqualToString:v9];
              }
            }
            goto LABEL_26;
          }
          id result = @"Rating-Movie_UK_R18";
        }
      }
      break;
    case 8:
      if ([(NSString *)self->_value isEqualToString:@"TV-Y"])
      {
        id result = @"Rating-TV_US_Y";
      }
      else if ([(NSString *)self->_value isEqualToString:@"TV-Y7"])
      {
        id result = @"Rating-TV_US_Y7";
      }
      else if ([(NSString *)self->_value isEqualToString:@"FV"])
      {
        id result = @"Rating-TV_US_Y7FV";
      }
      else if ([(NSString *)self->_value isEqualToString:@"TV-14"])
      {
        id result = @"Rating-TV_US_14";
      }
      else if ([(NSString *)self->_value isEqualToString:@"TV-G"])
      {
        id result = @"Rating-TV_US_G";
      }
      else if ([(NSString *)self->_value isEqualToString:@"TV-PG"])
      {
        id result = @"Rating-TV_US_PG";
      }
      else if ([(NSString *)self->_value isEqualToString:@"TV-MA"])
      {
        id result = @"Rating-TV_US_MA";
      }
      else if ([(NSString *)self->_value isEqualToString:@"D"])
      {
        id result = @"Rating-TV_US_D";
      }
      else if ([(NSString *)self->_value isEqualToString:@"L"])
      {
        id result = @"Rating-TV_US_L";
      }
      else if ([(NSString *)self->_value isEqualToString:@"S"])
      {
        id result = @"Rating-TV_US_S";
      }
      else
      {
        BOOL v5 = [(NSString *)self->_value isEqualToString:@"V"];
        uint64_t v6 = @"Rating-TV_US_V";
LABEL_20:
        if (v5) {
          id result = v6;
        }
        else {
          id result = 0;
        }
      }
      break;
    default:
LABEL_26:
      id result = 0;
      break;
  }
  return result;
}

- (BOOL)tint
{
  return ((self->_ratingType - 4) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (int64_t)_ratingTypeForType:(id)a3
{
  v3 = [a3 uppercaseString];
  if ([v3 isEqualToString:@"APPS-BRAZIL"])
  {
    int64_t v4 = 3;
  }
  else if (([v3 isEqualToString:@"GAMES"] & 1) != 0 {
         || ([v3 isEqualToString:@"ITUNESGAMES"] & 1) != 0
  }
         || ([v3 isEqualToString:@"ITUNES-GAMES"] & 1) != 0)
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"NZ-OFLC"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"BBFC"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"MPAA"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"RIAA"])
  {
    int64_t v4 = 5;
  }
  else if (([v3 isEqualToString:@"TV-US"] & 1) != 0 {
         || ([v3 isEqualToString:@"US-TV"] & 1) != 0
  }
         || [v3 isEqualToString:@"TV"])
  {
    int64_t v4 = 8;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_alloc_init(SSPaymentSheetRatingImage);
  v5->_ratingType = self->_ratingType;
  uint64_t v6 = [(NSString *)self->_urlString copyWithZone:a3];
  urlString = v5->_urlString;
  v5->_urlString = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_value copyWithZone:a3];
  value = v5->_value;
  v5->_value = (NSString *)v8;

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_ratingType);
  SSXPCDictionarySetObject(v3, "1", self->_urlString);
  SSXPCDictionarySetObject(v3, "2", self->_value);
  return v3;
}

- (SSPaymentSheetRatingImage)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSPaymentSheetRatingImage;
    uint64_t v6 = [(SSPaymentSheetRatingImage *)&v14 init];
    if (v6)
    {
      v6->_ratingType = xpc_dictionary_get_int64(v5, "0");
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v8);
      urlString = v6->_urlString;
      v6->_urlString = (NSString *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v11);
      value = v6->_value;
      v6->_value = (NSString *)v12;
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (int64_t)ratingType
{
  return self->_ratingType;
}

- (NSString)urlString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end