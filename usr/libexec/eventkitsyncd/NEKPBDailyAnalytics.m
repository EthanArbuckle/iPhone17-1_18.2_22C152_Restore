@interface NEKPBDailyAnalytics
- (BOOL)hasDuplicateCheck;
- (BOOL)hasOccurrenceCache;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NEKPBDuplicateCheck)duplicateCheck;
- (NEKPBOccurrenceCache)occurrenceCache;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuplicateCheck:(id)a3;
- (void)setOccurrenceCache:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBDailyAnalytics

- (BOOL)hasDuplicateCheck
{
  return self->_duplicateCheck != 0;
}

- (BOOL)hasOccurrenceCache
{
  return self->_occurrenceCache != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBDailyAnalytics;
  v3 = [(NEKPBDailyAnalytics *)&v7 description];
  v4 = [(NEKPBDailyAnalytics *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  duplicateCheck = self->_duplicateCheck;
  if (duplicateCheck)
  {
    v5 = [(NEKPBDuplicateCheck *)duplicateCheck dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"duplicateCheck"];
  }
  occurrenceCache = self->_occurrenceCache;
  if (occurrenceCache)
  {
    objc_super v7 = [(NEKPBOccurrenceCache *)occurrenceCache dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"occurrenceCache"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005FCE4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_duplicateCheck)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_occurrenceCache)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_duplicateCheck)
  {
    [v4 setDuplicateCheck:];
    id v4 = v5;
  }
  if (self->_occurrenceCache)
  {
    [v5 setOccurrenceCache:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NEKPBDuplicateCheck *)self->_duplicateCheck copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NEKPBOccurrenceCache *)self->_occurrenceCache copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((duplicateCheck = self->_duplicateCheck, !((unint64_t)duplicateCheck | v4[1]))
     || -[NEKPBDuplicateCheck isEqual:](duplicateCheck, "isEqual:")))
  {
    occurrenceCache = self->_occurrenceCache;
    if ((unint64_t)occurrenceCache | v4[2]) {
      unsigned __int8 v7 = -[NEKPBOccurrenceCache isEqual:](occurrenceCache, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NEKPBDuplicateCheck *)self->_duplicateCheck hash];
  return [(NEKPBOccurrenceCache *)self->_occurrenceCache hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  duplicateCheck = self->_duplicateCheck;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (duplicateCheck)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NEKPBDuplicateCheck mergeFrom:](duplicateCheck, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NEKPBDailyAnalytics setDuplicateCheck:](self, "setDuplicateCheck:");
  }
  id v4 = v9;
LABEL_7:
  occurrenceCache = self->_occurrenceCache;
  uint64_t v8 = v4[2];
  if (occurrenceCache)
  {
    if (v8) {
      -[NEKPBOccurrenceCache mergeFrom:](occurrenceCache, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NEKPBDailyAnalytics setOccurrenceCache:](self, "setOccurrenceCache:");
  }

  _objc_release_x1();
}

- (NEKPBDuplicateCheck)duplicateCheck
{
  return self->_duplicateCheck;
}

- (void)setDuplicateCheck:(id)a3
{
}

- (NEKPBOccurrenceCache)occurrenceCache
{
  return self->_occurrenceCache;
}

- (void)setOccurrenceCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceCache, 0);

  objc_storeStrong((id *)&self->_duplicateCheck, 0);
}

@end