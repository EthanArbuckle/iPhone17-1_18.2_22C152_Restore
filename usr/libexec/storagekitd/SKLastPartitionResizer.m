@interface SKLastPartitionResizer
- (id)fsResize:(id *)a3;
- (id)partResize:(id *)a3;
- (id)resizeStateMachine:(id *)a3;
- (unint64_t)currentSize;
@end

@implementation SKLastPartitionResizer

- (unint64_t)currentSize
{
  v3 = [SKLastPartitions alloc];
  v4 = [(SKDiskResizerBase *)self disk];
  v5 = [(SKLastPartitions *)v3 initWithDisk:v4];

  v6 = [(SKLastPartitions *)v5 resizablePart];
  v7 = (char *)[v6 unformattedSize];

  v18 = v7;
  v8 = [(SKLastPartitions *)v5 resizablePart];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v10 = [(SKLastPartitions *)v5 resizablePart];
  v11 = v10;
  if (isKindOfClass)
  {
    v12 = [v10 container];

    if (v12)
    {
      v7 = (char *)[v12 totalSpace];
      v18 = v7;
    }
  }
  else
  {
    v13 = [v10 type];
    unsigned int v14 = [v13 isEqualToString:kSKDiskTypeHFS];

    if (v14)
    {
      v15 = [(SKLastPartitions *)v5 resizablePart];
      +[SKLastPartitions hfsMinimalSizeForDisk:v15 currentSize:&v18];

      v7 = v18;
    }
  }
  v16 = &v7[[(SKLastPartitions *)v5 nonResizableSize]];

  return (unint64_t)v16;
}

- (id)partResize:(id *)a3
{
  v5 = [SKLastPartitions alloc];
  v6 = [(SKDiskResizerBase *)self disk];
  v7 = [(SKLastPartitions *)v5 initWithDisk:v6];

  uint64_t v8 = [(SKLastPartitions *)v7 resizablePart];
  if (!v8) {
    goto LABEL_3;
  }
  v9 = (void *)v8;
  v10 = [(SKLastPartitions *)v7 resizablePart];
  unsigned __int8 v11 = [v10 isWholeDisk];

  if (v11) {
    goto LABEL_3;
  }
  v15 = +[SKError frameworkBundle];
  v16 = [v15 localizedStringForKey:@"Resizing partition..." value:&stru_10004A7A8 table:0];
  v17 = [(SKDiskResizerBase *)self progress];
  [v17 setLocalizedAdditionalDescription:v16];

  unint64_t v18 = [(SKDiskResizerBase *)self requestedSize];
  unint64_t v19 = v18 - [(SKLastPartitions *)v7 nonResizableSize];
  v20 = sub_10000DD48();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [(SKLastPartitions *)v7 resizablePart];
    int v28 = 136315650;
    v29 = "-[SKLastPartitionResizer partResize:]";
    __int16 v30 = 2112;
    v31 = v21;
    __int16 v32 = 2048;
    unint64_t v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Resizing partition %@ to %lld bytes", (uint8_t *)&v28, 0x20u);
  }
  v22 = [SKPartitionTable alloc];
  v23 = [(SKDiskResizerBase *)self disk];
  v24 = [(SKPartitionTable *)v22 initWithDisk:v23 error:a3];

  if (!v24)
  {
    uint64_t v12 = [(SKDiskResizerBase *)self rollbackResize:a3];
    goto LABEL_4;
  }
  v25 = [(SKLastPartitions *)v7 resizablePart];
  v26 = +[SKPartitionTable partitionIDFromDisk:v25];

  if (v26)
  {
    if ([(SKPartitionTable *)v24 resizePartitionID:v26 size:v19 offset:0 error:a3])
    {

LABEL_3:
      [(SKDiskResizerBase *)self setCompletedUnitCount:(char *)[(SKDiskResizerBase *)self completedUnitCount] + 10];
      uint64_t v12 = [(SKDiskResizerBase *)self eventFromSize];
LABEL_4:
      v13 = (void *)v12;
      goto LABEL_5;
    }
  }
  else
  {
    id v27 = +[SKError errorWithCode:117 debugDescription:@"Failed to get the ID of the resized partition" error:a3];
  }
  v13 = [(SKDiskResizerBase *)self rollbackResize:a3];

LABEL_5:

  return v13;
}

- (id)fsResize:(id *)a3
{
  v5 = +[SKError frameworkBundle];
  v6 = [v5 localizedStringForKey:@"Resizing file system..." value:&stru_10004A7A8 table:0];
  v7 = [(SKDiskResizerBase *)self progress];
  [v7 setLocalizedAdditionalDescription:v6];

  uint64_t v8 = [SKLastPartitions alloc];
  v9 = [(SKDiskResizerBase *)self disk];
  v10 = [(SKLastPartitions *)v8 initWithDisk:v9];

  unint64_t v11 = [(SKDiskResizerBase *)self requestedSize];
  unint64_t v12 = v11 - [(SKLastPartitions *)v10 nonResizableSize];
  v13 = sub_10000DD48();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(SKLastPartitions *)v10 resizablePart];
    *(_DWORD *)buf = 136315650;
    v42 = "-[SKLastPartitionResizer fsResize:]";
    __int16 v43 = 2112;
    v44 = v14;
    __int16 v45 = 2048;
    unint64_t v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Resizing filesystem on %@ to %lld", buf, 0x20u);
  }
  v15 = [(SKLastPartitions *)v10 resizablePart];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v17 = [(SKDiskResizerBase *)self progress];
    if ([v17 isCancelled])
    {
      unint64_t v18 = [(SKDiskResizerBase *)self resizeError];

      if (!v18)
      {
        unint64_t v19 = sub_10000DD48();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[SKLastPartitionResizer fsResize:]";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: Cancelling resize before it starts", buf, 0xCu);
        }

        uint64_t v20 = [(SKDiskResizerBase *)self cancelWithError:a3];
        goto LABEL_22;
      }
    }
    else
    {
    }
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10002F5D0;
    v39[3] = &unk_100048B88;
    v29 = v10;
    v40 = v29;
    __int16 v30 = [(SKDiskResizerBase *)self progress];
    [v30 setCancellationHandler:v39];

    v31 = [(SKLastPartitions *)v29 resizablePart];
    id v32 = [v31 diskIdentifier];
    [v32 UTF8String];
    uint64_t v33 = APFSContainerResize();

    v34 = [(SKDiskResizerBase *)self progress];
    LODWORD(v32) = [v34 isCancelled];

    if (v32)
    {
      uint64_t v35 = [(SKDiskResizerBase *)self cancelWithError:a3];
LABEL_19:
      v37 = (void *)v35;

      goto LABEL_23;
    }
    if (v33)
    {
      id v36 = +[SKError nilWithOSStatus:v33 debugDescription:@"APFS container resize failed" error:a3];
      uint64_t v35 = [(SKDiskResizerBase *)self rollbackResize:a3];
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  v21 = [(SKLastPartitions *)v10 resizablePart];
  v22 = [v21 type];
  unsigned int v23 = [v22 isEqualToString:kSKDiskTypeHFS];

  if (!v23) {
    goto LABEL_21;
  }
  v24 = [(SKLastPartitions *)v10 resizablePart];
  v25 = +[SKPartitionTable createMediaRefWithDisk:v24 error:a3];

  if (v25)
  {
    v26 = [(SKLastPartitions *)v10 resizablePart];
    [v26 getSectorSize];

    uint64_t v27 = MKHFSResizeVolume();
    CFRelease(v25);
    if (v27)
    {
      id v28 = +[SKError errorWithOSStatus:v27 error:a3];
      goto LABEL_13;
    }
LABEL_21:
    [(SKDiskResizerBase *)self setCompletedUnitCount:(char *)[(SKDiskResizerBase *)self completedUnitCount] + 80];
    uint64_t v20 = [(SKDiskResizerBase *)self eventFromSize];
    goto LABEL_22;
  }
LABEL_13:
  uint64_t v20 = [(SKDiskResizerBase *)self rollbackResize:a3];
LABEL_22:
  v37 = (void *)v20;
LABEL_23:

  return v37;
}

- (id)resizeStateMachine:(id *)a3
{
  unint64_t v18 = sub_10000C314(@"kPartitionResize", (uint64_t)off_100055820, (uint64_t)"partResize:", @"kFSResize");
  v19[0] = v18;
  v4 = sub_10000C314(@"kFSResize", (uint64_t)off_100055820, (uint64_t)"fsResize:", (uint64_t)off_100055838);
  v19[1] = v4;
  v5 = sub_10000C348((uint64_t)off_100055838, (uint64_t)off_100055820);
  v19[2] = v5;
  v6 = sub_10000C314((uint64_t)off_100055838, (uint64_t)off_100055828, (uint64_t)"fsResize:", @"kPartitionResize");
  v19[3] = v6;
  v7 = sub_10000C314(@"kFSResize", (uint64_t)off_100055828, (uint64_t)"fsResize:", @"kPartitionResize");
  v19[4] = v7;
  uint64_t v8 = sub_10000C314(@"kPartitionResize", (uint64_t)off_100055828, (uint64_t)"partResize:", (uint64_t)off_100055840);
  v19[5] = v8;
  v9 = sub_10000C348((uint64_t)off_100055840, (uint64_t)off_100055828);
  v19[6] = v9;
  v10 = sub_10000C314((uint64_t)off_100055840, (uint64_t)off_100055820, (uint64_t)"partResize:", @"kFSResize");
  v19[7] = v10;
  unint64_t v11 = +[NSArray arrayWithObjects:v19 count:8];
  unint64_t v12 = +[SKStateTransitionTable tableWithTransitionEntries:v11 selectorTarget:self];

  v13 = [(SKDiskResizerBase *)self eventFromSize];
  if ([v13 isEqualToString:off_100055820]) {
    CFStringRef v14 = @"kPartitionResize";
  }
  else {
    CFStringRef v14 = @"kFSResize";
  }
  v15 = [(SKDiskResizerBase *)self eventFromSize];
  v16 = +[SKStateMachine machineWithStateTransitionTable:v12 startState:v14 startEvent:v15];

  return v16;
}

@end