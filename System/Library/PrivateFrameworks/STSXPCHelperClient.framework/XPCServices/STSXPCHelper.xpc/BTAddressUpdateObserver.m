@interface BTAddressUpdateObserver
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation BTAddressUpdateObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v31 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned int v12 = [v31 isEqualToString:@"advertisingAddress"];
  if (a6)
  {
    if (v12)
    {
      v13 = [v11 objectForKeyedSubscript:NSKeyValueChangeKindKey];
      id v14 = [v13 unsignedIntegerValue];

      if (v14 == (id)1)
      {
        v15 = a6;
        if (self) {
          lock = self->_lock;
        }
        else {
          lock = 0;
        }
        [(NSCondition *)lock lock];
        v17 = [v15 advertisingAddress];
        unsigned __int8 v18 = [v15 advertisingAddressType];
        if ([v17 length] == (id)6)
        {
          id v22 = [objc_alloc((Class)NSMutableData) initWithLength:7];
          id v23 = v17;
          v24 = [v23 bytes];
          id v25 = v22;
          v26 = (unsigned __int8 *)[v25 mutableBytes];
          v27 = (char *)[v23 length];
          if ((uint64_t)(v27 - 1) >= 0)
          {
            do
              *v26++ = (v27--)[(void)(v24 - 1)];
            while (v27);
          }
          unsigned __int8 *v26 = v18;
          if (self)
          {
            objc_storeStrong((id *)&self->_btAddress, v25);
            [(NSCondition *)self->_lock broadcast];
            v28 = self->_lock;
          }
          else
          {
            [0 broadcast];
            v28 = 0;
          }
          [(NSCondition *)v28 unlock];
        }
        else
        {
          sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[BTAddressUpdateObserver observeValueForKeyPath:ofObject:change:context:]", 54, @"LE: Unable to obtain address", v19, v20, v21, v30);
          if (self) {
            v29 = self->_lock;
          }
          else {
            v29 = 0;
          }
          [(NSCondition *)v29 unlock];
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end