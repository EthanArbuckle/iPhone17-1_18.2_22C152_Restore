@interface MLMovieProperties
- (MLMovieProperties)init;
- (MLMovieProperties)initWithMoviePropertiesDictionary:(id)a3;
- (NSArray)castMembers;
- (NSArray)directors;
- (NSArray)producers;
- (NSArray)screenwriters;
- (NSString)copyrightWarning;
- (NSString)studioName;
- (id)copyMoviePropertiesDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)_setValueCopy:(id)a3 forKey:(id)a4;
- (void)setCastMembers:(id)a3;
- (void)setCopyrightWarning:(id)a3;
- (void)setDirectors:(id)a3;
- (void)setProducers:(id)a3;
- (void)setScreenwriters:(id)a3;
- (void)setStudioName:(id)a3;
@end

@implementation MLMovieProperties

- (void).cxx_destruct
{
}

- (void)_setValueCopy:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [(MLMovieProperties *)self _setValue:v7 forKey:v6];
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

- (id)copyMoviePropertiesDictionary
{
  return (id)[(NSMutableDictionary *)self->_dictionary copy];
}

- (NSString)studioName
{
  return (NSString *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"studio"];
}

- (void)setStudioName:(id)a3
{
}

- (void)setScreenwriters:(id)a3
{
}

- (void)setProducers:(id)a3
{
}

- (void)setDirectors:(id)a3
{
}

- (void)setCopyrightWarning:(id)a3
{
}

- (void)setCastMembers:(id)a3
{
}

- (NSArray)screenwriters
{
  return (NSArray *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"screenwriters"];
}

- (NSArray)producers
{
  return (NSArray *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"producers"];
}

- (NSArray)directors
{
  return (NSArray *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"directors"];
}

- (NSString)copyrightWarning
{
  return (NSString *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"copy-warning"];
}

- (NSArray)castMembers
{
  return (NSArray *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"cast"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  dictionary = self->_dictionary;

  return (id)[v4 initWithMoviePropertiesDictionary:dictionary];
}

- (MLMovieProperties)initWithMoviePropertiesDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLMovieProperties;
  v5 = [(MLMovieProperties *)&v9 init];
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

- (MLMovieProperties)init
{
  return [(MLMovieProperties *)self initWithMoviePropertiesDictionary:0];
}

@end