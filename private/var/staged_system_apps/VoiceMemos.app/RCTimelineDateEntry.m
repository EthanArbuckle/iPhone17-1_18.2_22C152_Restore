@interface RCTimelineDateEntry
- (BOOL)isEqual:(id)a3;
- (NSDate)dateEntry;
- (RCTimelineDateEntry)initWithDateEntry:(id)a3 updateFidelity:(int64_t)a4 userInfo:(id)a5;
- (RCTimelineDateEntryUserInfo)userInfo;
- (id)description;
- (int64_t)updateFidelity;
- (unint64_t)hash;
- (void)setDateEntry:(id)a3;
- (void)setUpdateFidelity:(int64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation RCTimelineDateEntry

- (RCTimelineDateEntry)initWithDateEntry:(id)a3 updateFidelity:(int64_t)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RCTimelineDateEntry;
  v11 = [(RCTimelineDateEntry *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dateEntry, a3);
    v12->_updateFidelity = a4;
    objc_storeStrong((id *)&v12->_userInfo, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RCTimelineDateEntry *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(RCTimelineDateEntry *)self dateEntry];
      v7 = [(RCTimelineDateEntry *)v5 dateEntry];
      unsigned __int8 v8 = [v6 isEqual:v7];

      int64_t v9 = [(RCTimelineDateEntry *)self updateFidelity];
      id v10 = [(RCTimelineDateEntry *)v5 updateFidelity];
      v11 = [(RCTimelineDateEntry *)self userInfo];
      v12 = [(RCTimelineDateEntry *)v5 userInfo];

      unsigned __int8 v13 = [v11 isEqual:v12];
      if ((id)v9 == v10) {
        unsigned __int8 v14 = v8;
      }
      else {
        unsigned __int8 v14 = 0;
      }
      char v15 = v14 & v13;
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = [(RCTimelineDateEntry *)self dateEntry];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(RCTimelineDateEntry *)self updateFidelity] ^ v4;
  v6 = [(RCTimelineDateEntry *)self userInfo];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (id)description
{
  v3 = [(RCTimelineDateEntry *)self dateEntry];
  unint64_t v4 = [v3 bls_shortLoggingString];
  int64_t v5 = [(RCTimelineDateEntry *)self updateFidelity];
  v6 = [(RCTimelineDateEntry *)self userInfo];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"date = %@;  updateFidelity = %ld;  userInfo = %@",
    v4,
    v5,
  unint64_t v7 = v6);

  return v7;
}

- (NSDate)dateEntry
{
  return self->_dateEntry;
}

- (void)setDateEntry:(id)a3
{
}

- (int64_t)updateFidelity
{
  return self->_updateFidelity;
}

- (void)setUpdateFidelity:(int64_t)a3
{
  self->_updateFidelity = a3;
}

- (RCTimelineDateEntryUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_dateEntry, 0);
}

@end