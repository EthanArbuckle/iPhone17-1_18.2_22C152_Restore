@interface PGPet
- (BOOL)isFavorite;
- (NSString)localIdentifier;
- (NSString)name;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPersonNodeCollection)ownerNodes;
- (PGPet)initWithLocalIdentifier:(id)a3 petSpecies:(unint64_t)a4 name:(id)a5 isFavorite:(BOOL)a6 momentNodes:(id)a7 ownerNodes:(id)a8;
- (unint64_t)species;
- (void)addOwnerNodes:(id)a3;
@end

@implementation PGPet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerNodes, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (PGGraphPersonNodeCollection)ownerNodes
{
  return self->_ownerNodes;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (unint64_t)species
{
  return self->_species;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)addOwnerNodes:(id)a3
{
  v4 = [(MAElementCollection *)self->_ownerNodes collectionByFormingUnionWith:a3];
  ownerNodes = self->_ownerNodes;
  self->_ownerNodes = v4;
}

- (PGPet)initWithLocalIdentifier:(id)a3 petSpecies:(unint64_t)a4 name:(id)a5 isFavorite:(BOOL)a6 momentNodes:(id)a7 ownerNodes:(id)a8
{
  id v15 = a3;
  v16 = (__CFString *)a5;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PGPet;
  v19 = [(PGPet *)&v28 init];
  v20 = v19;
  if (v19)
  {
    if (v16) {
      v21 = v16;
    }
    else {
      v21 = &stru_1F283BC78;
    }
    objc_storeStrong((id *)&v19->_name, v21);
    objc_storeStrong((id *)&v20->_localIdentifier, a3);
    v20->_species = a4;
    v20->_isFavorite = a6;
    objc_storeStrong((id *)&v20->_momentNodes, a7);
    if (v18)
    {
      v22 = (PGGraphPersonNodeCollection *)v18;
      ownerNodes = v20->_ownerNodes;
      v20->_ownerNodes = v22;
    }
    else
    {
      v24 = [PGGraphPersonNodeCollection alloc];
      ownerNodes = [v17 graph];
      uint64_t v25 = [(MAElementCollection *)v24 initWithGraph:ownerNodes];
      v26 = v20->_ownerNodes;
      v20->_ownerNodes = (PGGraphPersonNodeCollection *)v25;
    }
  }

  return v20;
}

@end