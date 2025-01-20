@interface DirectionsPlanWaypoint
- (BOOL)hasSearchString;
- (BOOL)hasWaypoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOComposedWaypoint)waypoint;
- (NSString)searchString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setWaypoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DirectionsPlanWaypoint

- (BOOL)hasWaypoint
{
  return self->_waypoint != 0;
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)DirectionsPlanWaypoint;
  v3 = [(DirectionsPlanWaypoint *)&v7 description];
  v4 = [(DirectionsPlanWaypoint *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  waypoint = self->_waypoint;
  if (waypoint)
  {
    v5 = [(GEOComposedWaypoint *)waypoint dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"waypoint"];
  }
  searchString = self->_searchString;
  if (searchString) {
    [v3 setObject:searchString forKey:@"searchString"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1005CC4FC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_waypoint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_searchString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_waypoint)
  {
    [v4 setWaypoint:];
    id v4 = v5;
  }
  if (self->_searchString)
  {
    [v5 setSearchString:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(GEOComposedWaypoint *)self->_waypoint copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_searchString copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((waypoint = self->_waypoint, !((unint64_t)waypoint | v4[2]))
     || -[GEOComposedWaypoint isEqual:](waypoint, "isEqual:")))
  {
    searchString = self->_searchString;
    if ((unint64_t)searchString | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](searchString, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(GEOComposedWaypoint *)self->_waypoint hash];
  return [(NSString *)self->_searchString hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  waypoint = self->_waypoint;
  uint64_t v6 = v4[2];
  unsigned __int8 v7 = v4;
  if (waypoint)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOComposedWaypoint mergeFrom:](waypoint, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DirectionsPlanWaypoint setWaypoint:](self, "setWaypoint:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[DirectionsPlanWaypoint setSearchString:](self, "setSearchString:");
    id v4 = v7;
  }
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (void)setWaypoint:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoint, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

@end