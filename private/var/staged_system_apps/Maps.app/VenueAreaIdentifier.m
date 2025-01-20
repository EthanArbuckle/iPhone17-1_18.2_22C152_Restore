@interface VenueAreaIdentifier
+ (id)keyForVenue:(id)a3 building:(id)a4 floorOrdinal:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSNumber)buildingID;
- (NSNumber)floorOrdinal;
- (NSNumber)levelID;
- (VenueAreaIdentifier)initWithVenueID:(unint64_t)a3 buildingID:(id)a4 levelID:(id)a5 floorOrdinal:(id)a6;
- (unint64_t)hash;
- (unint64_t)venueID;
@end

@implementation VenueAreaIdentifier

- (VenueAreaIdentifier)initWithVenueID:(unint64_t)a3 buildingID:(id)a4 levelID:(id)a5 floorOrdinal:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VenueAreaIdentifier;
  v13 = [(VenueAreaIdentifier *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_venueID = a3;
    v15 = (NSNumber *)[v10 copy];
    buildingID = v14->_buildingID;
    v14->_buildingID = v15;

    v17 = (NSNumber *)[v11 copy];
    levelID = v14->_levelID;
    v14->_levelID = v17;

    v19 = (NSNumber *)[v12 copy];
    floorOrdinal = v14->_floorOrdinal;
    v14->_floorOrdinal = v19;
  }
  return v14;
}

+ (id)keyForVenue:(id)a3 building:(id)a4 floorOrdinal:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = [VenueAreaIdentifier alloc];
    id v11 = [v7 venueID];
    if (v8)
    {
      id v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 buildingId]);
      v13 = [(VenueAreaIdentifier *)v10 initWithVenueID:v11 buildingID:v12 levelID:0 floorOrdinal:v9];
    }
    else
    {
      v13 = [(VenueAreaIdentifier *)v10 initWithVenueID:v11 buildingID:0 levelID:0 floorOrdinal:v9];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = +[NSNumber numberWithUnsignedLongLong:[(VenueAreaIdentifier *)self venueID]];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(VenueAreaIdentifier *)self buildingID];
  unint64_t v6 = (unint64_t)[v5 hash];
  id v7 = [(VenueAreaIdentifier *)self levelID];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];
  id v9 = [(VenueAreaIdentifier *)self floorOrdinal];
  unint64_t v10 = v8 ^ (unint64_t)[v9 hash] ^ v4;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 venueID];
    if (v6 == (id)[(VenueAreaIdentifier *)self venueID])
    {
      id v7 = [v5 buildingID];
      unint64_t v8 = [(VenueAreaIdentifier *)self buildingID];
      if (+[NSNumber number:v7 isEqualToNumber:v8])
      {
        id v9 = [v5 levelID];
        unint64_t v10 = [(VenueAreaIdentifier *)self levelID];
        if (+[NSNumber number:v9 isEqualToNumber:v10])
        {
          id v11 = [v5 floorOrdinal];
          id v12 = [(VenueAreaIdentifier *)self floorOrdinal];
          BOOL v13 = +[NSNumber number:v11 isEqualToNumber:v12];
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)venueID
{
  return self->_venueID;
}

- (NSNumber)buildingID
{
  return self->_buildingID;
}

- (NSNumber)levelID
{
  return self->_levelID;
}

- (NSNumber)floorOrdinal
{
  return self->_floorOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorOrdinal, 0);
  objc_storeStrong((id *)&self->_levelID, 0);

  objc_storeStrong((id *)&self->_buildingID, 0);
}

@end