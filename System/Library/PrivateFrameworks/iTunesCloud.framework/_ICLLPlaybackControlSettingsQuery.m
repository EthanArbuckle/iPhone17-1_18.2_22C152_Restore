@interface _ICLLPlaybackControlSettingsQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLPlaybackControlSettingsQuery

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [(_ICLLPlaybackControlSettings *)self->_settings hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    settings = self->_settings;
    if ((unint64_t)settings | v4[1]) {
      char v6 = -[_ICLLPlaybackControlSettings isEqual:](settings, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_ICLLPlaybackControlSettings *)self->_settings copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)writeTo:(id)a3
{
  if (self->_settings) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackControlSettingsQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  settings = self->_settings;
  if (settings)
  {
    v5 = [(_ICLLPlaybackControlSettings *)settings dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"settings"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackControlSettingsQuery;
  v4 = [(_ICLLPlaybackControlSettingsQuery *)&v8 description];
  v5 = [(_ICLLPlaybackControlSettingsQuery *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end