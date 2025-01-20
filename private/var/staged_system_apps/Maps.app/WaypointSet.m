@interface WaypointSet
- (BOOL)areAllValidWaypoints;
- (BOOL)isEqual:(id)a3;
- (GEOComposedWaypoint)destination;
- (GEOComposedWaypoint)origin;
- (NSArray)waypointsOrNull;
- (WaypointSet)initWithWaypoints:(id)a3;
- (id)description;
- (id)waypointAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
@end

@implementation WaypointSet

- (WaypointSet)initWithWaypoints:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WaypointSet;
  v5 = [(WaypointSet *)&v19 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    waypointsOrNull = v5->_waypointsOrNull;
    v5->_waypointsOrNull = v6;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = v5->_waypointsOrNull;
    v9 = (char *)[(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v13 = 0;
            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = (char *)[(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    char v13 = 1;
LABEL_12:

    v5->_areAllValidWaypoints = v13;
  }

  return v5;
}

- (id)waypointAtIndex:(unint64_t)a3
{
  v5 = [(WaypointSet *)self waypointsOrNull];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    id v10 = 0;
  }
  else
  {
    v7 = [(WaypointSet *)self waypointsOrNull];
    v8 = [v7 objectAtIndexedSubscript:a3];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = 0;
    }
    else {
      v9 = v8;
    }
    id v10 = v9;
  }

  return v10;
}

- (GEOComposedWaypoint)origin
{
  return (GEOComposedWaypoint *)[(WaypointSet *)self waypointAtIndex:0];
}

- (GEOComposedWaypoint)destination
{
  v3 = [(WaypointSet *)self waypointsOrNull];
  id v4 = -[WaypointSet waypointAtIndex:](self, "waypointAtIndex:", (char *)[v3 count] - 1);

  return (GEOComposedWaypoint *)v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = sub_100769DCC(self->_waypointsOrNull);
  v5 = +[NSString stringWithFormat:@"<%@: %p, waypoints: %@>", v3, self, v4];

  return v5;
}

- (unint64_t)count
{
  v2 = [(WaypointSet *)self waypointsOrNull];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (WaypointSet *)a3;
  if (v5 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    if ([(WaypointSet *)v5 isMemberOfClass:objc_opt_class()])
    {
      id v6 = v5;
      v7 = v6;
      waypointsOrNull = self->_waypointsOrNull;
      v9 = waypointsOrNull;
      if (!waypointsOrNull)
      {
        id v3 = [(WaypointSet *)v6 waypointsOrNull];
        if (!v3)
        {
          unsigned __int8 v11 = 1;
          goto LABEL_11;
        }
        v9 = self->_waypointsOrNull;
      }
      id v10 = [(WaypointSet *)v7 waypointsOrNull];
      unsigned __int8 v11 = [(NSArray *)v9 isEqual:v10];

      if (waypointsOrNull)
      {
LABEL_12:

        goto LABEL_13;
      }
LABEL_11:

      goto LABEL_12;
    }
    unsigned __int8 v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSArray *)self->_waypointsOrNull hash];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSArray *)self->_waypointsOrNull countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (BOOL)areAllValidWaypoints
{
  return self->_areAllValidWaypoints;
}

- (NSArray)waypointsOrNull
{
  return self->_waypointsOrNull;
}

- (void).cxx_destruct
{
}

@end