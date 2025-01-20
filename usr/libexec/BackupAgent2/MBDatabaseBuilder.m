@interface MBDatabaseBuilder
+ (id)databaseBuilderWithEncoder:(id)a3;
- (MBDatabaseBuilder)initWithEncoder:(id)a3;
- (MBDatabaseIndex)index;
- (MBEncoder)encoder;
- (void)addFile:(id)a3 flags:(unint64_t)a4;
- (void)addPlaceholderForFile:(id)a3 flags:(unint64_t)a4;
- (void)close;
- (void)dealloc;
@end

@implementation MBDatabaseBuilder

+ (id)databaseBuilderWithEncoder:(id)a3
{
  v3 = [[MBDatabaseBuilder alloc] initWithEncoder:a3];

  return v3;
}

- (MBDatabaseBuilder)initWithEncoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MBDatabaseBuilder;
  v4 = [(MBDatabaseBuilder *)&v7 init];
  if (v4)
  {
    v4->_index = objc_alloc_init(MBDatabaseIndex);
    v5 = (MBEncoder *)a3;
    v4->_encoder = v5;
    [(MBEncoder *)v5 encodeInt32:1835164770];
    [(MBEncoder *)v4->_encoder encodeVersion:5.0];
    v4->_offsetBase = [(MBEncoder *)v4->_encoder offset];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDatabaseBuilder;
  [(MBDatabaseBuilder *)&v3 dealloc];
}

- (void)addFile:(id)a3 flags:(unint64_t)a4
{
  -[MBDatabaseIndex setOffset:flags:forFileID:](self->_index, "setOffset:flags:forFileID:", (char *)-[MBEncoder offset](self->_encoder, "offset") - self->_offsetBase, +[MBDatabaseIndex flagsForMode:](MBDatabaseIndex, "flagsForMode:", [a3 mode]) | a4, objc_msgSend(a3, "fileID"));
  [a3 encode:self->_encoder];
  encoder = self->_encoder;

  [(MBEncoder *)encoder flush];
}

- (void)addPlaceholderForFile:(id)a3 flags:(unint64_t)a4
{
  index = self->_index;
  unint64_t v6 = +[MBDatabaseIndex flagsForMode:](MBDatabaseIndex, "flagsForMode:", [a3 mode]) | a4;
  id v7 = [a3 fileID];

  [(MBDatabaseIndex *)index setOffset:-1 flags:v6 forFileID:v7];
}

- (void)close
{
}

- (MBEncoder)encoder
{
  return self->_encoder;
}

- (MBDatabaseIndex)index
{
  return self->_index;
}

@end