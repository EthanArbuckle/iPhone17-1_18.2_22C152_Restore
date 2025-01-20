@interface MLMovieArtist
- (MLMovieArtist)init;
- (MLMovieArtist)initWithMovieArtistDictionary:(id)a3;
- (NSNumber)ITunesStoreIdentifier;
- (NSString)artistName;
- (id)copyMovieArtistDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)_setValueCopy:(id)a3 forKey:(id)a4;
- (void)setArtistName:(id)a3;
- (void)setITunesStoreIdentifier:(id)a3;
@end

@implementation MLMovieArtist

- (void).cxx_destruct
{
}

- (void)_setValueCopy:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [(MLMovieArtist *)self _setValue:v7 forKey:v6];
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  dictionary = self->_dictionary;
  if (a3) {
    [(NSMutableDictionary *)dictionary setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)dictionary removeObjectForKey:a4];
  }
}

- (id)copyMovieArtistDictionary
{
  return (id)[(NSMutableDictionary *)self->_dictionary copy];
}

- (void)setITunesStoreIdentifier:(id)a3
{
}

- (void)setArtistName:(id)a3
{
}

- (NSNumber)ITunesStoreIdentifier
{
  return (NSNumber *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"adamId"];
}

- (NSString)artistName
{
  return (NSString *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"name"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  dictionary = self->_dictionary;

  return (id)[v4 initWithMovieArtistDictionary:dictionary];
}

- (MLMovieArtist)initWithMovieArtistDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLMovieArtist;
  v5 = [(MLMovieArtist *)&v9 init];
  if (v5)
  {
    if (v4) {
      id v6 = (NSMutableDictionary *)[v4 mutableCopy];
    }
    else {
      id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;
  }
  return v5;
}

- (MLMovieArtist)init
{
  return [(MLMovieArtist *)self initWithMovieArtistDictionary:0];
}

@end