@interface _UIDragDestinationControllerDropProposalState
- (BOOL)_hasDropActionTarget;
- (_UIDragDestinationControllerDropProposalState)init;
- (id)description;
- (id)effectiveIndexPath;
- (void)setDidDrop:(BOOL)a3;
- (void)setProposal:(id)a3;
@end

@implementation _UIDragDestinationControllerDropProposalState

- (id)effectiveIndexPath
{
  if (a1)
  {
    v2 = a1;
    if ([a1 _hasDropActionTarget]) {
      a1 = (id *)v2[3];
    }
    else {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (_UIDragDestinationControllerDropProposalState)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDragDestinationControllerDropProposalState;
  v2 = [(_UIDragDestinationControllerDropProposalState *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_didDrop = 0;
    indexPath = v2->_indexPath;
    v2->_indexPath = 0;

    v5 = [[UICollectionViewDropProposal alloc] initWithDropOperation:0 intent:0];
    proposal = v3->_proposal;
    v3->_proposal = v5;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self) {
    indexPath = self->_indexPath;
  }
  else {
    indexPath = 0;
  }
  v7 = indexPath;
  objc_super v8 = __UICVIndexPathDescription(v7);
  if (self)
  {
    v9 = self->_proposal;
    BOOL didDrop = self->_didDrop;
  }
  else
  {
    v9 = 0;
    BOOL didDrop = 0;
  }
  v11 = -[_UIDragDestinationControllerDropProposalState effectiveIndexPath]((id *)&self->super.isa);
  v12 = __UICVIndexPathDescription(v11);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: indexPath = %@; proposal = %@; BOOL didDrop = %d; effectiveIndexPath = %@>",
    v5,
    v8,
    v9,
    didDrop,
  v13 = v12);

  return v13;
}

- (BOOL)_hasDropActionTarget
{
  if (self) {
    proposal = self->_proposal;
  }
  else {
    proposal = 0;
  }
  v4 = proposal;
  if ([(UICollectionViewDropProposal *)v4 intent] == UICollectionViewDropIntentInsertAtDestinationIndexPath)
  {
  }
  else
  {
    if (self) {
      v5 = self->_proposal;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = [(UICollectionViewDropProposal *)v5 intent];

    if (v6 != 2) {
      return 0;
    }
  }
  if (self) {
    indexPath = self->_indexPath;
  }
  else {
    indexPath = 0;
  }
  return indexPath != 0;
}

- (void)setProposal:(id)a3
{
}

- (void)setDidDrop:(BOOL)a3
{
  self->_BOOL didDrop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_proposal, 0);
}

@end