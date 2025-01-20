@interface MessagesTextInputModelDataSource
- (MessagesTextInputModelDataSource)init;
- (id)nextOutgoingMessageBatch;
- (unint64_t)nextRowID;
- (void)reset;
- (void)setNextRowID:(unint64_t)a3;
@end

@implementation MessagesTextInputModelDataSource

- (MessagesTextInputModelDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)MessagesTextInputModelDataSource;
  result = [(MessagesTextInputModelDataSource *)&v3 init];
  if (result) {
    result->_currentMaxRow = 0;
  }
  return result;
}

- (void)setNextRowID:(unint64_t)a3
{
  self->_currentMaxRow = a3;
}

- (void)reset
{
  self->_currentMaxRow = 0;
}

- (unint64_t)nextRowID
{
  return self->_currentMaxRow;
}

- (id)nextOutgoingMessageBatch
{
  uint64_t v3 = IMDMessageRecordCountMessages();
  int64_t currentMaxRow = self->_currentMaxRow;
  if (((v3 - currentMaxRow) & ~((v3 - currentMaxRow) >> 63)) >= 1000) {
    uint64_t v5 = 1000;
  }
  else {
    uint64_t v5 = (v3 - currentMaxRow) & ~((v3 - currentMaxRow) >> 63);
  }
  BOOL v7 = v3 <= currentMaxRow;
  uint64_t v6 = v3 - currentMaxRow;
  BOOL v7 = v7 || v6 < 1;
  if (v7 || (CFArrayRef v8 = (const __CFArray *)IMDMessageRecordCopyMessagesBetweenRowIDs()) == 0)
  {
    id v11 = 0;
  }
  else
  {
    CFArrayRef v9 = v8;
    uint64_t v22 = v5;
    if (CFArrayGetCount(v8) < 1)
    {
      id v11 = 0;
    }
    else
    {
      CFIndex v10 = 0;
      id v11 = 0;
      do
      {
        CFArrayGetValueAtIndex(v9, v10);
        uint64_t v26 = -1;
        v27[0] = 0;
        uint64_t v24 = -1;
        uint64_t v25 = -1;
        v23 = 0;
        IMDMessageRecordBulkCopy();
        if (!v25)
        {
          unint64_t v12 = (unint64_t)objc_msgSend(v23, "unsignedLongLongValue", 0, v27, 0, &v23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0);
          v13 = (const void *)IMDMessageRecordCopyHandle();
          if (v13)
          {
            CFAllocatorGetDefault();
            CFStringRef v14 = (const __CFString *)IMDHandleRecordCopyID();
          }
          else
          {
            CFStringRef v14 = 0;
          }
          if (v26 < 1) {
            id v15 = 0;
          }
          else {
            id v15 = +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:(double)v26];
          }
          if (v27[0] && CFStringGetLength(v27[0]) && v14 && CFStringGetLength(v14) && v15)
          {
            id v16 = v11;
            uint64_t v17 = (v12 >> 2) & 1;
            v18 = [MessagesDataSourceMessage alloc];
            v19 = [(MessagesDataSourceMessage *)v18 initWithDate:v15 recipient:v14 body:v27[0]];
            uint64_t v20 = v17;
            id v11 = v16;
            [(MessagesDataSourceMessage *)v19 setFromMe:v20];
            [(MessagesDataSourceMessage *)v19 setRowID:v24];
            [(MessagesDataSourceMessage *)v19 setGuid:0];
            if (!v16) {
              id v11 = objc_alloc_init((Class)NSMutableArray);
            }
            [v11 addObject:v19];
          }
          if (v13) {
            CFRelease(v13);
          }
          if (v14) {
            CFRelease(v14);
          }
          if (v23)
          {
            CFRelease(v23);
            v23 = 0;
          }
        }
        if (v27[0])
        {
          CFRelease(v27[0]);
          v27[0] = 0;
        }
        ++v10;
      }
      while (v10 < CFArrayGetCount(v9));
    }
    CFRelease(v9);
    uint64_t v5 = v22;
  }
  self->_currentMaxRow += v5;
  return v11;
}

@end