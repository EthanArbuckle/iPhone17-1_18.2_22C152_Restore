@interface PSISearchEntityTranslator
+ (id)_lookupIdentifierForSearchEntity:(id)a3;
+ (id)psiGroupFromSearchEntity:(id)a3;
+ (id)zeroScorePSIGroupFromLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5;
+ (unint64_t)_indexCategoryForSearchEntityType:(unint64_t)a3;
@end

@implementation PSISearchEntityTranslator

+ (unint64_t)_indexCategoryForSearchEntityType:(unint64_t)a3
{
  unint64_t result = 0;
  if ((uint64_t)a3 > 1519)
  {
    if ((uint64_t)a3 <= 1899)
    {
      if (a3 == 1802) {
        unint64_t v4 = 1802;
      }
      else {
        unint64_t v4 = 0;
      }
      if (a3 == 1801) {
        unint64_t v4 = 1801;
      }
      if (a3 == 1800) {
        unint64_t v4 = 1800;
      }
      if (a3 == 1701) {
        uint64_t v5 = 1701;
      }
      else {
        uint64_t v5 = 0;
      }
      if (a3 == 1700) {
        uint64_t v5 = 1700;
      }
      if ((uint64_t)a3 <= 1799) {
        unint64_t v4 = v5;
      }
      if (a3 == 1610) {
        unint64_t v6 = 1610;
      }
      else {
        unint64_t v6 = 0;
      }
      if (a3 == 1600) {
        unint64_t v6 = 1600;
      }
      if (a3 == 1540) {
        unint64_t v6 = 1540;
      }
      if (a3 == 1530) {
        uint64_t v7 = 1530;
      }
      else {
        uint64_t v7 = 0;
      }
      if (a3 == 1520) {
        uint64_t v7 = 1520;
      }
      if ((uint64_t)a3 <= 1539) {
        unint64_t v6 = v7;
      }
      BOOL v8 = (uint64_t)a3 <= 1699;
    }
    else
    {
      if ((uint64_t)a3 <= 1999)
      {
        switch(a3)
        {
          case 0x76CuLL:
          case 0x76DuLL:
          case 0x76EuLL:
          case 0x76FuLL:
          case 0x770uLL:
          case 0x771uLL:
          case 0x772uLL:
          case 0x773uLL:
          case 0x774uLL:
          case 0x775uLL:
          case 0x776uLL:
          case 0x777uLL:
          case 0x778uLL:
          case 0x779uLL:
          case 0x77AuLL:
          case 0x77BuLL:
            goto LABEL_96;
          case 0x77CuLL:
            unint64_t result = 1917;
            break;
          case 0x77DuLL:
            unint64_t result = 1918;
            break;
          case 0x77EuLL:
            unint64_t result = 1919;
            break;
          default:
            return result;
        }
        return result;
      }
      if (a3 == 2600) {
        unint64_t v4 = 2600;
      }
      else {
        unint64_t v4 = 0;
      }
      if (a3 == 2500) {
        unint64_t v4 = 2500;
      }
      if (a3 == 2401) {
        uint64_t v9 = 2401;
      }
      else {
        uint64_t v9 = 0;
      }
      if (a3 == 2400) {
        uint64_t v9 = 2400;
      }
      if ((uint64_t)a3 <= 2499) {
        unint64_t v4 = v9;
      }
      if (a3 == 2300) {
        unint64_t v6 = 2300;
      }
      else {
        unint64_t v6 = 0;
      }
      if (a3 == 2200) {
        unint64_t v6 = 2200;
      }
      if (a3 == 2100) {
        uint64_t v10 = 2100;
      }
      else {
        uint64_t v10 = 0;
      }
      if (a3 == 2000) {
        uint64_t v10 = 2000;
      }
      if ((uint64_t)a3 <= 2199) {
        unint64_t v6 = v10;
      }
      BOOL v8 = (uint64_t)a3 <= 2399;
    }
LABEL_90:
    if (v8) {
      return v6;
    }
    else {
      return v4;
    }
  }
  if ((uint64_t)a3 > 1099)
  {
    if ((uint64_t)a3 > 1299)
    {
      if (a3 == 1510) {
        unint64_t v4 = 1510;
      }
      else {
        unint64_t v4 = 0;
      }
      if (a3 == 1500) {
        unint64_t v4 = 1500;
      }
      if (a3 == 1401) {
        uint64_t v11 = 1401;
      }
      else {
        uint64_t v11 = 0;
      }
      if (a3 == 1400) {
        uint64_t v11 = 1400;
      }
      if ((uint64_t)a3 <= 1499) {
        unint64_t v4 = v11;
      }
      if (a3 == 1330) {
        unint64_t v6 = 1330;
      }
      else {
        unint64_t v6 = 0;
      }
      if (a3 == 1320) {
        unint64_t v6 = 1320;
      }
      if (a3 == 1310) {
        uint64_t v12 = 1310;
      }
      else {
        uint64_t v12 = 0;
      }
      if (a3 == 1300) {
        uint64_t v12 = 1300;
      }
      if ((uint64_t)a3 <= 1319) {
        unint64_t v6 = v12;
      }
      BOOL v8 = (uint64_t)a3 <= 1399;
      goto LABEL_90;
    }
    switch(a3)
    {
      case 0x4B0uLL:
      case 0x4B1uLL:
      case 0x4B2uLL:
      case 0x4B3uLL:
LABEL_96:
        unint64_t result = a3;
        break;
      case 0x4B4uLL:
        unint64_t result = 1205;
        break;
      default:
        switch(a3)
        {
          case 0x44CuLL:
          case 0x44DuLL:
            goto LABEL_96;
          case 0x44EuLL:
            unint64_t result = 1103;
            break;
          case 0x44FuLL:
            unint64_t result = 1104;
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
        goto LABEL_96;
      default:
        switch(a3)
        {
          case 0x3E8uLL:
          case 0x3E9uLL:
          case 0x3EAuLL:
          case 0x3EBuLL:
            goto LABEL_96;
          case 0x3ECuLL:
            unint64_t result = 1005;
            break;
          default:
            return result;
        }
        break;
    }
  }
  return result;
}

+ (id)zeroScorePSIGroupFromLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = -[PSIGroup initWithContentString:lookupIdentifier:category:score:]([PSIGroup alloc], "initWithContentString:lookupIdentifier:category:score:", v9, v8, (__int16)[a1 _indexCategoryForSearchEntityType:a4], 0.0);

  return v10;
}

+ (id)_lookupIdentifierForSearchEntity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  id v5 = 0;
  if (v4 > 1519)
  {
    if (v4 > 1599)
    {
      if (v4 == 1600)
      {
        unint64_t v6 = [v3 identifier];
        uint64_t v21 = [v6 integerValue];
        [NSString stringWithFormat:@"%@/%lu", @"meaning", v21];
LABEL_26:
        id v5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_30;
      }
      if (v4 != 2500)
      {
        if (v4 != 2600) {
          goto LABEL_30;
        }
        uint64_t v12 = [v3 identifier];
        uint64_t v13 = [v12 integerValue];

        [NSString stringWithFormat:@"%@/%u", @"humanAction", v13];
        goto LABEL_29;
      }
      v19 = [v3 identifier];
      uint64_t v8 = [v19 integerValue];

      id v9 = NSString;
      uint64_t v10 = @"audio";
    }
    else
    {
      switch(v4)
      {
        case 1520:
          v16 = [v3 identifier];
          uint64_t v8 = [v16 integerValue];

          id v9 = NSString;
          uint64_t v10 = @"privateEncryptedComputeKGID";
          break;
        case 1530:
          v17 = [v3 identifier];
          uint64_t v8 = [v17 integerValue];

          id v9 = NSString;
          uint64_t v10 = @"privateEncryptedComputeMUID";
          break;
        case 1540:
          uint64_t v7 = [v3 identifier];
          uint64_t v8 = [v7 integerValue];

          id v9 = NSString;
          uint64_t v10 = @"privateEncryptedComputeAMP";
          break;
        default:
          goto LABEL_30;
      }
    }
    goto LABEL_28;
  }
  if (v4 > 1329)
  {
    switch(v4)
    {
      case 1330:
        goto LABEL_20;
      case 1500:
        v18 = [v3 identifier];
        uint64_t v8 = [v18 integerValue];

        id v9 = NSString;
        uint64_t v10 = @"scene";
        break;
      case 1510:
        uint64_t v11 = [v3 identifier];
        uint64_t v8 = [v11 integerValue];

        id v9 = NSString;
        uint64_t v10 = @"parseRichLabel";
        break;
      default:
        goto LABEL_30;
    }
LABEL_28:
    [v9 stringWithFormat:@"%@/%llu", v10, v8];
    goto LABEL_29;
  }
  if (v4 != 1103)
  {
    if (v4 != 1300)
    {
      if (v4 != 1320) {
        goto LABEL_30;
      }
      unint64_t v6 = [v3 identifier];
      [NSString stringWithFormat:@"%@/%@", @"contributor", v6];
      goto LABEL_26;
    }
LABEL_20:
    id v5 = [v3 identifier];

    goto LABEL_30;
  }
  v14 = [v3 identifier];
  uint64_t v15 = [v14 integerValue];

  [NSString stringWithFormat:@"%@/%lu", @"season", v15];
LABEL_29:
  id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v5;
}

+ (id)psiGroupFromSearchEntity:(id)a3
{
  id v4 = a3;
  __int16 v5 = objc_msgSend(a1, "_indexCategoryForSearchEntityType:", objc_msgSend(v4, "type"));
  unint64_t v6 = [a1 _lookupIdentifierForSearchEntity:v4];
  uint64_t v7 = [PSIGroup alloc];
  uint64_t v8 = [v4 label];
  [v4 rankingScore];
  double v10 = v9;

  uint64_t v11 = [(PSIGroup *)v7 initWithContentString:v8 lookupIdentifier:v6 category:v5 score:v10];
  return v11;
}

@end