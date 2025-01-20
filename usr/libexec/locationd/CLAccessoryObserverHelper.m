@interface CLAccessoryObserverHelper
+ (BOOL)isDenyListAccessory:(id)a3 name:(id)a4 model:(id)a5 serialNumber:(id)a6 firmware:(id)a7 hardwareRevision:(id)a8;
+ (BOOL)isString:(id)a3 prefixedBy:(id)a4;
@end

@implementation CLAccessoryObserverHelper

+ (BOOL)isString:(id)a3 prefixedBy:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    if ([a3 rangeOfString:a4 options:9]) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v5 == 0;
    }
    return !v6;
  }
  return result;
}

+ (BOOL)isDenyListAccessory:(id)a3 name:(id)a4 model:(id)a5 serialNumber:(id)a6 firmware:(id)a7 hardwareRevision:(id)a8
{
  id v13 = a3;
  if (a3) {
    id v13 = [a3 stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")];
  }
  if (a4) {
    a4 = [a4 stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")];
  }
  if (a5) {
    a5 = [a5 stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")];
  }
  if (a6) {
    a6 = [a6 stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")];
  }
  if (a7) {
    a7 = [a7 stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")];
  }
  if (a8) {
    a8 = [a8 stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")];
  }
  if (v13 && a5 && a7)
  {
    if (![v13 caseInsensitiveCompare:@"HARMAN"]
      && ![a5 caseInsensitiveCompare:@"MIB2"]
      && (+[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, @"CLU4_MMX2_VW")|| +[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, @"CLU4_MMX2_SK")|| +[CLAccessoryObserverHelper isString:a7 prefixedBy:@"CLU4_MMX2_SE"]))
    {
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      v17 = qword_102419368;
      if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Rejecting accessory on deny list: HARMAN", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_61;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419360 == -1)
      {
LABEL_74:
        v19 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "+[CLAccessoryObserverHelper isDenyListAccessory:name:model:serialNumber:firmware:hardwareRevision:]", "%s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
LABEL_61:
        LOBYTE(v14) = 1;
        return v14;
      }
LABEL_76:
      dispatch_once(&qword_102419360, &stru_1022BED80);
      goto LABEL_74;
    }
    if (![v13 caseInsensitiveCompare:@"VOLKSWAGEN AG"]
      && ![a5 caseInsensitiveCompare:@"MIB STD"]
      && ![a7 caseInsensitiveCompare:@"1.0.0"]
      && a6
      && ![a6 caseInsensitiveCompare:@"EP.2015.1"])
    {
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      v18 = qword_102419368;
      if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Rejecting accessory on deny list: Volkswagen AG, 1.0.0", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_61;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419360 == -1) {
        goto LABEL_74;
      }
      goto LABEL_76;
    }
    if ((![v13 caseInsensitiveCompare:@"VOLKSWAGEN AG"]
       || ![v13 caseInsensitiveCompare:@"SKODA AUTO a.s."]
       || ![v13 caseInsensitiveCompare:@"SEAT S.A."])
      && ![a5 caseInsensitiveCompare:@"MIB STD"]
      && (![a7 caseInsensitiveCompare:@"2.0.0"]
       || +[CLAccessoryObserverHelper isString:prefixedBy:](CLAccessoryObserverHelper, "isString:prefixedBy:", a7, @"035")|| +[CLAccessoryObserverHelper isString:a7 prefixedBy:@"X35"]))
    {
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      v16 = qword_102419368;
      if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Rejecting accessory on deny list: Volkswagen AG, 2.0.0", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_61;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419360 == -1) {
        goto LABEL_74;
      }
      goto LABEL_76;
    }
  }
  LOBYTE(v14) = 0;
  if (v13 && a4 && a5 && a7 && a8)
  {
    if (![a4 caseInsensitiveCompare:@"BENTLEY"]
      && (![v13 caseInsensitiveCompare:@"HARMAN"]
       || ![v13 caseInsensitiveCompare:@"AISIN"])
      && ![a5 caseInsensitiveCompare:@"MIB2"])
    {
      BOOL v14 = +[CLAccessoryObserverHelper isString:a7 prefixedBy:@"CLU5_"];
      if (!v14) {
        return v14;
      }
      if (![a8 caseInsensitiveCompare:@"1.0.0"])
      {
        if (qword_102419360 != -1) {
          dispatch_once(&qword_102419360, &stru_1022BED80);
        }
        v15 = qword_102419368;
        if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Rejecting accessory on deny list: BENTLEY", buf, 2u);
        }
        if (!sub_10013D1A0(115, 2)) {
          goto LABEL_61;
        }
        bzero(buf, 0x65CuLL);
        if (qword_102419360 == -1) {
          goto LABEL_74;
        }
        goto LABEL_76;
      }
    }
    LOBYTE(v14) = 0;
  }
  return v14;
}

@end