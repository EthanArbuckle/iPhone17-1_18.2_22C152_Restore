@interface SDKAddToLibraryResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)updateRequired;
- (NSMutableDictionary)addedItems;
- (NSString)currentGlobalID;
- (SDKAddToLibraryResponseParserDelegate)init;
- (unint64_t)currentAdamID;
- (unint64_t)currentCloudID;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation SDKAddToLibraryResponseParserDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGlobalID, 0);

  objc_storeStrong((id *)&self->_addedItems, 0);
}

- (NSString)currentGlobalID
{
  return self->_currentGlobalID;
}

- (unint64_t)currentAdamID
{
  return self->_currentAdamID;
}

- (unint64_t)currentCloudID
{
  return self->_currentCloudID;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (NSMutableDictionary)addedItems
{
  return self->_addedItems;
}

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1835821428 && self->_currentCloudID)
  {
    id v12 = v6;
    if (self->_currentAdamID)
    {
      addedItems = self->_addedItems;
      v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
      v10 = +[NSNumber numberWithUnsignedLongLong:self->_currentAdamID];
      [(NSMutableDictionary *)addedItems setObject:v9 forKey:v10];
    }
    else
    {
      id v6 = [(NSString *)self->_currentGlobalID length];
      id v7 = v12;
      if (!v6) {
        goto LABEL_8;
      }
      v11 = self->_addedItems;
      v9 = +[NSNumber numberWithUnsignedLongLong:self->_currentCloudID];
      [(NSMutableDictionary *)v11 setObject:v9 forKey:self->_currentGlobalID];
    }

    id v7 = v12;
  }
LABEL_8:

  _objc_release_x1(v6, v7);
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if ((int)a4 > 1835624803)
  {
    if (a4 == 1836413042)
    {
      self->_updateRequired = *a5 != 0;
    }
    else
    {
      if (a4 != 1835624804) {
        goto LABEL_14;
      }
      if (a6 == 8)
      {
        unint64_t v13 = (((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))
            + a5[7];
      }
      else
      {
        if (a6 != 4) {
          goto LABEL_14;
        }
        unint64_t v13 = bswap32(*(_DWORD *)a5);
      }
      self->_currentCloudID = v13;
    }
  }
  else if (a4 == 1634025833)
  {
    self->_currentAdamID = (((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))
                         + a5[7];
  }
  else if (a4 == 1634357319)
  {
    id v14 = v10;
    v11 = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    currentGlobalID = self->_currentGlobalID;
    self->_currentGlobalID = v11;

    id v10 = v14;
  }
LABEL_14:
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    self->_currentCloudID = 0;
    self->_currentAdamID = 0;
    self->_currentGlobalID = 0;
    _objc_release_x1();
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1634353989 || v4;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835624803)
  {
    if ((int)a4 > 1835821427)
    {
      if (a4 == 1835821428) {
        return result;
      }
      int v6 = 1836413042;
    }
    else
    {
      if (a4 == 1835624804) {
        return result;
      }
      int v6 = 1835819884;
    }
  }
  else
  {
    if ((int)a4 > 1634353992)
    {
      if (a4 == 1634353993) {
        return result;
      }
      unsigned __int16 v5 = 20551;
    }
    else
    {
      if (a4 == 1634025833) {
        return result;
      }
      unsigned __int16 v5 = 17221;
    }
    int v6 = v5 | 0x616A0000;
  }
  if (a4 != v6) {
    return 0;
  }
  return result;
}

- (SDKAddToLibraryResponseParserDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDKAddToLibraryResponseParserDelegate;
  v2 = [(SDKAddToLibraryResponseParserDelegate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    addedItems = v2->_addedItems;
    v2->_addedItems = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end