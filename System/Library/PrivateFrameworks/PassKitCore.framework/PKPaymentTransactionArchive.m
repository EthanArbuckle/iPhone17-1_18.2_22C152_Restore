@interface PKPaymentTransactionArchive
- (BOOL)allArchiveLocationsWithType:(unint64_t)a3 areArchived:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArchive:(id)a3;
- (NSSet)locations;
- (NSString)identifier;
- (id)archiveLocationMatchingLocation:(id)a3;
- (id)archiveLocationsWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4;
- (id)archiveLocationsWithType:(unint64_t)a3 isArchived:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)insertOrUpdateArchiveLocationWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4 insertionMode:(unint64_t)a5;
- (void)setIdentifier:(id)a3;
- (void)setLocations:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateArchiveLocationsWithType:(unint64_t)a3 isArchived:(BOOL)a4;
- (void)updateTransactionArchiveLocationsWithArchive:(id)a3 type:(unint64_t)a4 archived:(BOOL)a5;
@end

@implementation PKPaymentTransactionArchive

- (void)updateArchiveLocationsWithType:(unint64_t)a3 isArchived:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self->_locations;
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", (void)v12) == a3) {
          [v11 setArchived:v4];
        }
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)allArchiveLocationsWithType:(unint64_t)a3 areArchived:(BOOL)a4
{
  int v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_locations;
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "isArchived", (void)v14) != v4 || objc_msgSend(v11, "type") != a3)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 1;
  }
LABEL_13:

  return v12;
}

- (id)archiveLocationMatchingLocation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_locations;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "type", (void)v17);
        if (v10 == [v4 type])
        {
          v11 = [v9 cloudStoreZone];
          BOOL v12 = [v4 cloudStoreZone];
          long long v13 = v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {

            if (v11 == v13) {
              goto LABEL_18;
            }
          }
          else
          {
            char v15 = [v11 isEqual:v12];

            if (v15)
            {
LABEL_18:
              id v6 = v9;
              goto LABEL_19;
            }
          }
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  return v6;
}

- (id)archiveLocationsWithType:(unint64_t)a3 isArchived:(BOOL)a4
{
  int v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_locations;
  uint64_t v9 = [(NSSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", (void)v16) == a3 && objc_msgSend(v13, "isArchived") == v4) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  BOOL v14 = (void *)[v7 copy];
  return v14;
}

- (id)archiveLocationsWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4
{
  int v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_locations;
  uint64_t v9 = [(NSSet *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "cloudStoreZone", (void)v19);
        char v15 = (void *)v14;
        if (v6 && v14)
        {
          if (([v6 isEqual:v14] & 1) == 0) {
            goto LABEL_12;
          }
        }
        else if ((id)v14 != v6)
        {
LABEL_12:

          continue;
        }
        int v16 = [v13 isArchived];

        if (v16 == v4) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  long long v17 = (void *)[v7 copy];
  return v17;
}

- (void)insertOrUpdateArchiveLocationWithCloudStoreZone:(id)a3 isArchived:(BOOL)a4 insertionMode:(unint64_t)a5
{
  uint64_t v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = self->_locations;
    id v10 = (id)[(NSSet *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      unsigned int v21 = v6;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = [v13 cloudStoreZone];
          if (v14)
          {
            char v15 = v14;
            char v16 = [v14 isEqual:v8];

            if (v16)
            {
              id v10 = v13;
              goto LABEL_13;
            }
          }
        }
        id v10 = (id)[(NSSet *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_13:
      uint64_t v6 = v21;
    }

    long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_locations];
    if (a5 == 1)
    {
      if (v10) {
        goto LABEL_20;
      }
    }
    else
    {
      if (a5)
      {
LABEL_20:
        long long v19 = (NSSet *)[v17 copy];
        locations = self->_locations;
        self->_locations = v19;

        goto LABEL_21;
      }
      if (v10)
      {
        [v10 setArchived:v6];
        goto LABEL_20;
      }
    }
    long long v18 = [[PKPaymentTransactionArchiveLocation alloc] initWithType:0 archived:v6 cloudStoreZone:v8];
    [v17 addObject:v18];

    goto LABEL_20;
  }
LABEL_21:
}

- (void)updateTransactionArchiveLocationsWithArchive:(id)a3 type:(unint64_t)a4 archived:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = objc_msgSend(a3, "locations", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 type] == a4)
        {
          uint64_t v14 = [(PKPaymentTransactionArchive *)self archiveLocationMatchingLocation:v13];
          char v15 = v14;
          if (v14) {
            [v14 setArchived:v5];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (PKPaymentTransactionArchive *)a3;
  BOOL v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransactionArchive *)self isEqualToArchive:v5];

  return v6;
}

- (BOOL)isEqualToArchive:(id)a3
{
  int v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  BOOL v6 = (void *)v4[2];
  id v7 = self->_identifier;
  id v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_13;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_13;
    }
  }
  if (self->_type != v5[1])
  {
LABEL_13:
    char v13 = 0;
    goto LABEL_14;
  }
  locations = self->_locations;
  BOOL v12 = (NSSet *)v5[3];
  if (locations && v12) {
    char v13 = -[NSSet isEqual:](locations, "isEqual:");
  }
  else {
    char v13 = locations == v12;
  }
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_locations];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", @"type: '%lu'; ", self->_type);
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"locations: '%@'; ", self->_locations];
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSSet)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end