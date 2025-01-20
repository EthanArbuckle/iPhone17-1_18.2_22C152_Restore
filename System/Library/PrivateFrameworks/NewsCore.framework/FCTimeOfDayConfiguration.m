@interface FCTimeOfDayConfiguration
- (FCTimeOfDayConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)end;
- (int64_t)start;
@end

@implementation FCTimeOfDayConfiguration

- (id)description
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[FCTimeOfDayConfiguration start](self, "start"));
  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[FCTimeOfDayConfiguration end](self, "end"));
  v6 = [v3 stringWithFormat:@"(Start: %@, End: %@)", v4, v5];

  return v6;
}

- (int64_t)start
{
  return self->_start;
}

- (int64_t)end
{
  return self->_end;
}

- (FCTimeOfDayConfiguration)initWithDictionary:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCTimeOfDayConfiguration;
  v5 = [(FCTimeOfDayConfiguration *)&v11 init];
  if (v5)
  {
    v6 = FCAppConfigurationNumberValue(v4, @"start", 0);
    uint64_t v7 = FCAppConfigurationNumberValue(v4, @"end", 0);
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v5->_start = [v6 longLongValue];
      v5->_end = [v8 longLongValue];
    }
    else
    {
      v9 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v4;
        _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Invalid time of day configuration %{public}@", buf, 0xCu);
      }

      v5 = 0;
    }
  }
  return v5;
}

@end