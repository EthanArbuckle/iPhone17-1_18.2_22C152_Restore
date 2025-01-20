@interface WAMessageAWD
- (id)_valuesForRepeatedField:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation WAMessageAWD

- (id)_valuesForRepeatedField:(id)a3
{
  id v4 = +[NSMutableArray array];
  if (objc_msgSend(objc_msgSend(a3, "repeatableValues"), "count"))
  {
    unint64_t v5 = 0;
    do
      [v4 addObject:[objc_msgSend(objc_msgSend(a3, "repeatableValues"), "objectAtIndex:", v5++)];
    while (v5 < (unint64_t)[[objc_msgSend(objc_msgSend(a3, "repeatableValues")) count]];
  }
  return v4;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [[-[WAMessageAWD mutableFields](self, "mutableFields") allValues];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = "-[WAMessageAWD(WiFi) dictionaryRepresentation]";
    uint64_t v8 = *(void *)v22;
    id v20 = v4;
LABEL_3:
    uint64_t v9 = 0;
    while (2)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
      switch((unint64_t)[v10 type])
      {
        case 1uLL:
          if ([v10 isRepeatable]) {
            goto LABEL_22;
          }
          [v10 doubleValue];
          v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          goto LABEL_23;
        case 2uLL:
          if ([v10 isRepeatable]) {
            goto LABEL_22;
          }
          [v10 floatValue];
          v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          goto LABEL_23;
        case 3uLL:
          if ([v10 isRepeatable]) {
            goto LABEL_22;
          }
          v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 int32Value]);
          goto LABEL_23;
        case 4uLL:
          if ([v10 isRepeatable]) {
            goto LABEL_22;
          }
          v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v10 int64Value]);
          goto LABEL_23;
        case 5uLL:
          if ([v10 isRepeatable]) {
            goto LABEL_22;
          }
          v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 uint32Value]);
          goto LABEL_23;
        case 6uLL:
          if ([v10 isRepeatable]) {
            goto LABEL_22;
          }
          v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 uint64Value]);
          goto LABEL_23;
        case 7uLL:
          if ([v10 isRepeatable]) {
            goto LABEL_22;
          }
          v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 BOOLValue]);
          goto LABEL_23;
        case 8uLL:
          if ([v10 isRepeatable]) {
LABEL_22:
          }
            v11 = [(WAMessageAWD *)self _valuesForRepeatedField:v10];
          else {
            v11 = (NSNumber *)[v10 stringValue];
          }
          goto LABEL_23;
        case 0xAuLL:
          if ([v10 isRepeatable])
          {
            v12 = v7;
            v13 = self;
            id v14 = +[NSMutableArray array];
            if (objc_msgSend(objc_msgSend(v10, "repeatableValues"), "count"))
            {
              unint64_t v15 = 0;
              do
              {
                id v16 = [objc_msgSend(v10, "repeatableValues") objectAtIndex:v15];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v14 addObject:[v16 dictionaryRepresentation]];
                }
                ++v15;
              }
              while (v15 < (unint64_t)[[v10 repeatableValues] count]);
            }
            [v3 setValue:v14 forKey:[v10 key]];
            self = v13;
            v7 = v12;
            id v4 = v20;
          }
          else
          {
            v11 = (NSNumber *)[objc_msgSend(objc_msgSend(v10, "subMessageValue"), "dictionaryRepresentation")];
LABEL_23:
            [v3 setValue:v11 forKey:[v10 key]];
          }
LABEL_24:
          if ((id)++v9 != v6) {
            continue;
          }
          id v17 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
          id v6 = v17;
          if (!v17) {
            goto LABEL_37;
          }
          goto LABEL_3;
        default:
          NSLog(@"%s: unhandled field %@", v7, v10);
          goto LABEL_24;
      }
    }
  }
LABEL_37:
  return v3;
}

@end