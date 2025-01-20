@interface PGMomentNodeCachedValues
- (BOOL)hasAddressNodes;
- (BOOL)hasAddressNodesIsSet;
- (CLLocationCoordinate2D)bestLocationCoordinate;
- (NSSet)personLocalIdentifiers;
- (PGGraphMomentNode)nextMomentNode;
- (PGGraphMomentNode)previousMomentNode;
- (PGMomentNodeCachedValues)init;
- (double)neighborScore;
- (void)setBestLocationCoordinate:(CLLocationCoordinate2D)a3;
- (void)setHasAddressNodes:(BOOL)a3;
- (void)setHasAddressNodesIsSet:(BOOL)a3;
- (void)setNeighborScore:(double)a3;
- (void)setNextMomentNode:(id)a3;
- (void)setPersonLocalIdentifiers:(id)a3;
- (void)setPreviousMomentNode:(id)a3;
@end

@implementation PGMomentNodeCachedValues

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextMomentNode, 0);
  objc_storeStrong((id *)&self->_previousMomentNode, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

- (void)setHasAddressNodesIsSet:(BOOL)a3
{
  self->_hasAddressNodesIsSet = a3;
}

- (BOOL)hasAddressNodesIsSet
{
  return self->_hasAddressNodesIsSet;
}

- (void)setHasAddressNodes:(BOOL)a3
{
  self->_hasAddressNodes = a3;
}

- (BOOL)hasAddressNodes
{
  return self->_hasAddressNodes;
}

- (void)setNextMomentNode:(id)a3
{
}

- (PGGraphMomentNode)nextMomentNode
{
  return self->_nextMomentNode;
}

- (void)setPreviousMomentNode:(id)a3
{
}

- (PGGraphMomentNode)previousMomentNode
{
  return self->_previousMomentNode;
}

- (void)setBestLocationCoordinate:(CLLocationCoordinate2D)a3
{
  self->_bestLocationCoordinate = a3;
}

- (CLLocationCoordinate2D)bestLocationCoordinate
{
  double latitude = self->_bestLocationCoordinate.latitude;
  double longitude = self->_bestLocationCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setPersonLocalIdentifiers:(id)a3
{
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (void)setNeighborScore:(double)a3
{
  self->_neighborScore = a3;
}

- (double)neighborScore
{
  return self->_neighborScore;
}

- (PGMomentNodeCachedValues)init
{
  v9.receiver = self;
  v9.super_class = (Class)PGMomentNodeCachedValues;
  v2 = [(PGMomentNodeCachedValues *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_neighborScore = NAN;
    v2->_bestLocationCoordinate = CLLocationCoordinate2DMake(NAN, NAN);
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
    previousMomentNode = v3->_previousMomentNode;
    v3->_previousMomentNode = (PGGraphMomentNode *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    nextMomentNode = v3->_nextMomentNode;
    v3->_nextMomentNode = (PGGraphMomentNode *)v6;
  }
  return v3;
}

@end