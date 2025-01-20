@interface MBDatabaseFileEnumerator
- (MBDatabaseFileEnumerator)initWithDecoder:(id)a3 database:(id)a4;
- (id)nextObject;
- (void)dealloc;
@end

@implementation MBDatabaseFileEnumerator

- (MBDatabaseFileEnumerator)initWithDecoder:(id)a3 database:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MBDatabaseFileEnumerator;
  v6 = [(MBDatabaseFileEnumerator *)&v8 init];
  if (v6)
  {
    v6->_decoder = (MBDecoder *)a3;
    v6->_database = (MBDatabase *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDatabaseFileEnumerator;
  [(MBDatabaseFileEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  unint64_t v3 = [(MBDecoder *)self->_decoder offset];
  if (v3 >= [(NSData *)[(MBDecoder *)self->_decoder data] length]) {
    return 0;
  }
  decoder = self->_decoder;
  database = self->_database;
  return +[MBFile fileWithDecoder:decoder database:database];
}

@end