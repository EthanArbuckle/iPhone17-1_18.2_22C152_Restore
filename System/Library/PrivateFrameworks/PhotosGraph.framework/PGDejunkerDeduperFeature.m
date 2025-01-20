@interface PGDejunkerDeduperFeature
- (BOOL)hasPeopleScenes;
- (BOOL)hasPersons;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVideo;
- (NSSet)peopleScenes;
- (NSSet)personLocalIdentifiers;
- (PGDejunkerDeduperFeature)initWithPersonLocalIdentifiers:(id)a3 peopleScenes:(id)a4 isVideo:(BOOL)a5;
- (id)description;
- (int64_t)identicalSimilarity;
- (unint64_t)hash;
@end

@implementation PGDejunkerDeduperFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleScenes, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (NSSet)peopleScenes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)personLocalIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  p_personLocalIdentifiers = &self->_personLocalIdentifiers;
  if ([(NSSet *)self->_personLocalIdentifiers count]) {
    goto LABEL_4;
  }
  peopleScenes = self->_peopleScenes;
  p_peopleScenes = &self->_peopleScenes;
  if ([(NSSet *)peopleScenes count])
  {
    p_personLocalIdentifiers = p_peopleScenes;
LABEL_4:
    v6 = [(NSSet *)*p_personLocalIdentifiers allObjects];
    v7 = [v6 sortedArrayUsingSelector:sel_compare_];
    v8 = [v7 componentsJoinedByString:@", "];

    goto LABEL_5;
  }
  v8 = @"nobody";
LABEL_5:
  return v8;
}

- (BOOL)hasPeopleScenes
{
  return [(NSSet *)self->_peopleScenes count] != 0;
}

- (BOOL)hasPersons
{
  return [(NSSet *)self->_personLocalIdentifiers count] != 0;
}

- (int64_t)identicalSimilarity
{
  return [(NSSet *)self->_personLocalIdentifiers count] || [(NSSet *)self->_peopleScenes count] != 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGDejunkerDeduperFeature *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      personLocalIdentifiers = self->_personLocalIdentifiers;
      BOOL v6 = (personLocalIdentifiers == v7->_personLocalIdentifiers
         || -[NSSet isEqualToSet:](personLocalIdentifiers, "isEqualToSet:"))
        && ((peopleScenes = self->_peopleScenes, peopleScenes == v7->_peopleScenes)
         || -[NSSet isEqualToSet:](peopleScenes, "isEqualToSet:"))
        && self->_isVideo == v7->_isVideo;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_personLocalIdentifiers hash];
  uint64_t v4 = [(NSSet *)self->_peopleScenes hash] ^ v3;
  uint64_t v5 = [NSNumber numberWithBool:self->_isVideo];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (PGDejunkerDeduperFeature)initWithPersonLocalIdentifiers:(id)a3 peopleScenes:(id)a4 isVideo:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGDejunkerDeduperFeature;
  v11 = [(PGDejunkerDeduperFeature *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personLocalIdentifiers, a3);
    objc_storeStrong((id *)&v12->_peopleScenes, a4);
    v12->_isVideo = a5;
  }

  return v12;
}

@end