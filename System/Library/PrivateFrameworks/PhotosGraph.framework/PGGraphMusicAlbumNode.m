@interface PGGraphMusicAlbumNode
- (BOOL)hasProperties:(id)a3;
- (NSString)title;
- (PGGraphMusicAlbumNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphMusicAlbumNode)initWithTitle:(id)a3;
- (id)description;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphMusicAlbumNode

- (void).cxx_destruct
{
}

- (NSString)title
{
  return self->_title;
}

- (unsigned)domain
{
  return 1000;
}

- (id)label
{
  v2 = @"MusicAlbum";
  return @"MusicAlbum";
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PGGraphMusicAlbumNode (%@)", self->_title];
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  title = self->_title;
  v5 = @"name";
  v6[0] = title;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"name"];
    v7 = v6;
    BOOL v8 = !v6 || [v6 isEqual:self->_title];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (PGGraphMusicAlbumNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6 = objc_msgSend(a5, "objectForKeyedSubscript:", @"name", a4);
  v7 = [(PGGraphMusicAlbumNode *)self initWithTitle:v6];

  return v7;
}

- (PGGraphMusicAlbumNode)initWithTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMusicAlbumNode;
  v6 = [(PGGraphNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_title, a3);
  }

  return v7;
}

@end