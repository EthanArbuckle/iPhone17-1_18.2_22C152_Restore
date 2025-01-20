@interface INHomeAttributeValue(ActionIdentifier)
- (uint64_t)re_actionIdentifierHashValue;
@end

@implementation INHomeAttributeValue(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  switch([a1 type])
  {
    case 1:
      v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "unit"));
      uint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "BOOLValue"));
      goto LABEL_9;
    case 2:
      v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "unit"));
      uint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      v6 = NSNumber;
      [a1 doubleValue];
      v4 = objc_msgSend(v6, "numberWithDouble:");
      goto LABEL_9;
    case 3:
      v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "unit"));
      uint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      v4 = [a1 stringValue];
      goto LABEL_9;
    case 4:
      v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "unit"));
      uint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      v7 = NSNumber;
      uint64_t v8 = [a1 integerValue];
      goto LABEL_8;
    case 5:
      v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "unit"));
      uint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      v7 = NSNumber;
      uint64_t v8 = [a1 limitValue];
LABEL_8:
      v4 = [v7 numberWithInteger:v8];
LABEL_9:
      v9 = v4;
      uint64_t v5 = objc_msgSend(v4, "re_actionIdentifierHashValue") ^ v3;

      break;
    default:
      v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "unit"));
      uint64_t v5 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      break;
  }

  return v5;
}

@end