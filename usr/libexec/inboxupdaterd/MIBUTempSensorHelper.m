@interface MIBUTempSensorHelper
+ (id)readKey:(unsigned int)a3 error:(id *)a4;
@end

@implementation MIBUTempSensorHelper

+ (id)readKey:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = +[NSString stringWithFormat:@"%c%c%c%c", HIBYTE(a3), BYTE2(a3), BYTE1(a3), a3];
  v49[0] = @"PrimaryUsagePage";
  v49[1] = @"PrimaryUsage";
  v50[0] = &off_10005FDF0;
  v50[1] = &off_10005FE08;
  v49[2] = @"LocationID";
  v7 = +[NSNumber numberWithUnsignedInt:v5];
  v50[2] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];

  uint64_t v9 = IOHIDEventSystemClientCreate();
  if (v9)
  {
    v10 = (__IOHIDEventSystemClient *)v9;
    IOHIDEventSystemClientSetMatching();
    CFArrayRef v11 = IOHIDEventSystemClientCopyServices(v10);
    if (v11)
    {
      CFArrayRef v12 = v11;
      if (CFArrayGetCount(v11) == 1)
      {
        CFArrayGetValueAtIndex(v12, 0);
        uint64_t v13 = IOHIDServiceClientCopyEvent();
        if (v13)
        {
          v14 = (const void *)v13;
          IOHIDEventGetFloatValue();
          v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          id v16 = 0;
          goto LABEL_6;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058960);
        }
        v38 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003D91C((uint64_t)v6, v38, v39, v40, v41, v42, v43, v44);
        }
        v45 = 0;
        sub_1000102B8(&v45, 2684354566, 0, @"Failed to read temp key: %@; failed to copy event",
          v41,
          v42,
          v43,
          v44,
          (uint64_t)v6);
        v37 = v45;
      }
      else
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100058940);
        }
        v32 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003D988((uint64_t)v6, v32, v12);
        }
        v46 = 0;
        CFArrayGetCount(v12);
        sub_1000102B8(&v46, 2684354566, 0, @"Failed to read temp key: %@; %lu matching sensors",
          v33,
          v34,
          v35,
          v36,
          (uint64_t)v6);
        v37 = v46;
      }
      id v16 = v37;
      v14 = 0;
      v15 = 0;
LABEL_6:
      CFRelease(v10);
      CFRelease(v12);
      if (v14) {
        CFRelease(v14);
      }
      if (a4) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058920);
    }
    v25 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003D8B0((uint64_t)v6, v25, v26, v27, v28, v29, v30, v31);
    }
    id v47 = 0;
    sub_1000102B8(&v47, 2684354566, 0, @"Failed to read temp key: %@; no matching sensors",
      v28,
      v29,
      v30,
      v31,
      (uint64_t)v6);
    id v16 = v47;
    CFRelease(v10);
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058900);
    }
    v18 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003D844((uint64_t)v6, v18, v19, v20, v21, v22, v23, v24);
    }
    id v48 = 0;
    sub_1000102B8(&v48, 2684354566, 0, @"Failed to read temp key: %@; failed to create HID event system",
      v21,
      v22,
      v23,
      v24,
      (uint64_t)v6);
    id v16 = v48;
  }
  v15 = 0;
  if (a4) {
LABEL_9:
  }
    *a4 = v16;
LABEL_10:

  return v15;
}

@end