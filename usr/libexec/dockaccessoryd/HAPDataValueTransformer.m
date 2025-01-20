@interface HAPDataValueTransformer
+ (BOOL)isValidFormat:(unint64_t)a3;
+ (Class)expectedTransformedClassForFormat:(unint64_t)a3;
+ (id)defaultDataValueTransformer;
+ (void)initialize;
- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
@end

@implementation HAPDataValueTransformer

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  if (a3 - 1 > 0xC)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (BOOL)isValidFormat:(unint64_t)a3
{
  return (a3 < 0x10) & (0x3FFEu >> a3);
}

+ (id)defaultDataValueTransformer
{
  return (id)qword_1002AD698;
}

+ (void)initialize
{
  if (!qword_1002AD698)
  {
    v2 = objc_alloc_init(HAPDataValueTransformer);
    uint64_t v3 = (void *)qword_1002AD698;
    qword_1002AD698 = (uint64_t)v2;
  }
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!v8)
  {
    if (+[HAPDataValueTransformer isValidFormat:a4])
    {
      id v11 = +[NSData data];
LABEL_11:
      v12 = v11;
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  v31.receiver = self;
  v31.super_class = (Class)HAPDataValueTransformer;
  v9 = [(HAPValueTransformer *)&v31 transformedValue:v8 format:a4 error:a5];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0) {
    goto LABEL_17;
  }
  if (!+[HAPDataValueTransformer isValidFormat:a4])
  {
LABEL_9:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_10:
      id v11 = v8;
      goto LABEL_11;
    }
    v13 = sub_10007ACE0(a4);
    v14 = +[NSString stringWithFormat:@"Invalid format type '%@' for value of class '%@'", v13, objc_opt_class()];

    v15 = sub_100083F74();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v16;
      __int16 v33 = 2112;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] %@", buf, 0x16u);
    }
    if (a5)
    {
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      v38 = v14;
      v17 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      *a5 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6717 userInfo:v17];
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  switch(a4)
  {
    case 1uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_1002815E0] == (id)1
        || [v19 compare:&off_1002815F8] == (id)-1)
      {
        goto LABEL_67;
      }
      unsigned __int8 v20 = [v19 unsignedCharValue];
      goto LABEL_41;
    case 2uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_100281610] == (id)1
        || [v19 compare:&off_1002815F8] == (id)-1)
      {
        goto LABEL_67;
      }
      unsigned __int16 v21 = (unsigned __int16)[v19 unsignedShortValue];
      goto LABEL_46;
    case 3uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_100281628] == (id)1
        || [v19 compare:&off_1002815F8] == (id)-1)
      {
        goto LABEL_67;
      }
      unsigned int v22 = [v19 unsignedIntValue];
      goto LABEL_51;
    case 4uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_100281640] == (id)1
        || [v19 compare:&off_1002815F8] == (id)-1)
      {
        goto LABEL_67;
      }
      id v23 = [v19 unsignedLongLongValue];
      goto LABEL_56;
    case 5uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_100281520] == (id)1
        || [v19 compare:&off_100281538] == (id)-1)
      {
        goto LABEL_67;
      }
      unsigned __int8 v20 = [v19 charValue];
LABEL_41:
      buf[0] = v20;
      uint64_t v24 = 1;
      goto LABEL_66;
    case 6uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_100281550] == (id)1
        || [v19 compare:&off_100281568] == (id)-1)
      {
        goto LABEL_67;
      }
      unsigned __int16 v21 = (unsigned __int16)[v19 shortValue];
LABEL_46:
      *(_WORD *)buf = v21;
      uint64_t v24 = 2;
      goto LABEL_66;
    case 7uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_100281580] == (id)1
        || [v19 compare:&off_100281598] == (id)-1)
      {
        goto LABEL_67;
      }
      unsigned int v22 = [v19 intValue];
LABEL_51:
      *(_DWORD *)buf = v22;
      goto LABEL_65;
    case 8uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_1002815B0] == (id)1
        || [v19 compare:&off_1002815C8] == (id)-1)
      {
        goto LABEL_67;
      }
      id v23 = [v19 longLongValue];
LABEL_56:
      *(void *)buf = v23;
      uint64_t v24 = 8;
      goto LABEL_66;
    case 9uLL:
      buf[0] = 0;
      if ([v8 isEqual:&__kCFBooleanFalse]) {
        goto LABEL_60;
      }
      if (![v8 isEqual:&__kCFBooleanTrue]) {
        goto LABEL_17;
      }
      buf[0] = 1;
LABEL_60:
      id v11 = +[NSData dataWithBytes:buf length:1];
      goto LABEL_11;
    case 0xAuLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v19 = v8;
      if ([v19 compare:&off_100281720] == (id)1
        || [v19 compare:&off_100281730] == (id)-1)
      {
LABEL_67:
        v12 = 0;
      }
      else
      {
        [v19 floatValue];
        *(_DWORD *)buf = v25;
LABEL_65:
        uint64_t v24 = 4;
LABEL_66:
        v12 = +[NSData dataWithBytes:buf length:v24];
      }

      break;
    case 0xBuLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_71;
      }
      id v11 = [v8 dataUsingEncoding:4];
      goto LABEL_11;
    case 0xCuLL:
    case 0xDuLL:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_10;
      }
      goto LABEL_71;
    default:
LABEL_71:
      v26 = sub_100083F74();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = sub_100083FD0(0);
        v28 = sub_10007ACE0(a4);
        v29 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v27;
        __int16 v33 = 2112;
        v34 = v28;
        __int16 v35 = 2112;
        v36 = v29;
        id v30 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] Invalid format/class (%@/%@) combination.", buf, 0x20u);
      }
      if (!a5) {
        goto LABEL_17;
      }
      +[NSError errorWithDomain:@"HAPErrorDomain" code:-6737 userInfo:0];
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
LABEL_18:

  return v12;
}

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8
    && (v24.receiver = self,
        v24.super_class = (Class)HAPDataValueTransformer,
        -[HAPValueTransformer reverseTransformedValue:format:error:](&v24, "reverseTransformedValue:format:error:", v8, a4, a5), v9 = objc_claimAutoreleasedReturnValue(), unsigned int v10 = [v8 isEqual:v9], v9, !v10))
  {
    id v16 = 0;
  }
  else if (+[HAPDataValueTransformer isValidFormat:a4])
  {
    id v11 = v8;
    v12 = v11;
    switch(a4)
    {
      case 1uLL:
        if ([v11 length] != (id)1) {
          goto LABEL_34;
        }
        +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)[v12 bytes]);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 2uLL:
        if ([v11 length] != (id)2) {
          goto LABEL_34;
        }
        +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)[v12 bytes]);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 3uLL:
        if ([v11 length] != (id)4) {
          goto LABEL_34;
        }
        +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)[v12 bytes]);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 4uLL:
        if ([v11 length] != (id)8) {
          goto LABEL_34;
        }
        +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(void *)[v12 bytes]);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 5uLL:
        if ([v11 length] != (id)1) {
          goto LABEL_34;
        }
        +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", *(char *)[v12 bytes]);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 6uLL:
        if ([v11 length] != (id)2) {
          goto LABEL_34;
        }
        +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", *(__int16 *)[v12 bytes]);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 7uLL:
        if ([v11 length] != (id)4) {
          goto LABEL_34;
        }
        +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)[v12 bytes]);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 8uLL:
        if ([v11 length] != (id)8) {
          goto LABEL_34;
        }
        +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(void *)[v12 bytes]);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 9uLL:
        if ([v11 length] != (id)1) {
          goto LABEL_34;
        }
        if (*(unsigned char *)[v12 bytes] == 1) {
          v17 = &__kCFBooleanTrue;
        }
        else {
          v17 = &__kCFBooleanFalse;
        }
        id v13 = v17;
        goto LABEL_41;
      case 0xAuLL:
        if ([v11 length] != (id)4) {
          goto LABEL_34;
        }
        LODWORD(v18) = *(_DWORD *)[v12 bytes];
        id v13 = +[NSNumber numberWithFloat:v18];
        goto LABEL_41;
      case 0xBuLL:
        id v13 = [objc_alloc((Class)NSString) initWithData:v11 encoding:4];
        goto LABEL_41;
      default:
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        {
          id v13 = v11;
LABEL_41:
          id v16 = v13;
        }
        else
        {
          if (![v12 length]) {
            goto LABEL_39;
          }
LABEL_34:
          id v19 = sub_100083F74();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            unsigned __int8 v20 = sub_100083FD0(0);
            unsigned __int16 v21 = sub_10007ACE0(a4);
            unsigned int v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 length]);
            *(_DWORD *)buf = 138543874;
            v26 = v20;
            __int16 v27 = 2112;
            unint64_t v28 = (unint64_t)v21;
            __int16 v29 = 2112;
            id v30 = v22;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] Invalid format/data length (%@/%@) combination.", buf, 0x20u);
          }
          if (a5)
          {
            +[NSError errorWithDomain:@"HAPErrorDomain" code:-6737 userInfo:0];
            id v16 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_39:
            id v16 = 0;
          }
        }

        break;
    }
  }
  else
  {
    v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = sub_100083FD0(0);
      *(_DWORD *)buf = 138543618;
      v26 = v15;
      __int16 v27 = 2048;
      unint64_t v28 = a4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPDataValueTransformer] Invalid format '%tu', returning value unchanged", buf, 0x16u);
    }
    id v16 = v8;
  }

  return v16;
}

@end