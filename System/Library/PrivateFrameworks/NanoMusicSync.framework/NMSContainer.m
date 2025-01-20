@interface NMSContainer
- (NMSContainer)initWithPersistentID:(id)a3 name:(id)a4 type:(unint64_t)a5;
- (NSNumber)addedDate;
- (NSNumber)persistentID;
- (NSNumber)playedDate;
- (NSString)name;
- (unint64_t)type;
- (void)setAddedDate:(id)a3;
- (void)setPlayedDate:(id)a3;
@end

@implementation NMSContainer

- (NMSContainer)initWithPersistentID:(id)a3 name:(id)a4 type:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NMSContainer;
  v11 = [(NMSContainer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_persistentID, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_type = a5;
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSNumber)addedDate
{
  return self->_addedDate;
}

- (void)setAddedDate:(id)a3
{
}

- (NSNumber)playedDate
{
  return self->_playedDate;
}

- (void)setPlayedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playedDate, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end