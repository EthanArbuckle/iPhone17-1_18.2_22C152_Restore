@interface KCSharingMergeConflict
- (KCSharingMergeConflict)initWithRemotelyChangedIncomingDatabaseItem:(SecDbItem *)a3 locallyChangedOutgoingDatabaseItem:(SecDbItem *)a4;
- (KCSharingMergeConflict)initWithRemotelyChangedIncomingDatabaseItem:(SecDbItem *)a3 locallyDeletedOutgoingDatabaseItem:(SecDbItem *)a4;
- (KCSharingMergeConflict)initWithRemotelyDeletedIncomingDatabaseItem:(SecDbItem *)a3 locallyChangedOutgoingDatabaseItem:(SecDbItem *)a4 mirrorDatabaseItem:(SecDbItem *)a5;
- (KCSharingMergeConflict)initWithRemotelyDeletedIncomingDatabaseItem:(SecDbItem *)a3 locallyDeletedOutgoingDatabaseItem:(SecDbItem *)a4 mirrorDatabaseItem:(SecDbItem *)a5;
- (id)incomingDatabaseItem;
- (id)mirrorDatabaseItem;
- (id)outgoingDatabaseItem;
- (id)resolveWithAccessGroups:(id)a3 error:(id *)a4;
- (int64_t)type;
@end

@implementation KCSharingMergeConflict

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mirrorDatabaseItem, 0);
  objc_storeStrong(&self->_outgoingDatabaseItem, 0);

  objc_storeStrong(&self->_incomingDatabaseItem, 0);
}

- (id)mirrorDatabaseItem
{
  return self->_mirrorDatabaseItem;
}

- (id)outgoingDatabaseItem
{
  return self->_outgoingDatabaseItem;
}

- (id)incomingDatabaseItem
{
  return self->_incomingDatabaseItem;
}

- (int64_t)type
{
  return self->_type;
}

- (id)resolveWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(KCSharingDatabaseUpdatePlan);
  switch([(KCSharingMergeConflict *)self type])
  {
    case 0:
      v8 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
      v9 = [(KCSharingMergeConflict *)self mirrorDatabaseItem];
      [v8 addObject:v9];

      v10 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
      v11 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
      [v10 addObject:v11];

      goto LABEL_3;
    case 1:
      v14 = [KCSharingIncomingEntry alloc];
      v15 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
      v12 = [(KCSharingIncomingRow *)v14 initWithIncomingDatabaseItem:v15 error:a4];

      if (!v12) {
        goto LABEL_16;
      }
      v16 = [KCSharingOutgoingDeletion alloc];
      v17 = [(KCSharingMergeConflict *)self outgoingDatabaseItem];
      v13 = [(KCSharingOutgoingDeletion *)v16 initWithPlaceholderOutgoingDatabaseItem:v17 error:a4];

      if (!v13) {
        goto LABEL_19;
      }
      v18 = [(KCSharingIncomingEntry *)v12 record];
      v19 = [v18 recordChangeTag];
      v20 = [(KCSharingOutgoingDeletion *)v13 recordChangeTag];
      unsigned int v21 = [v19 isEqual:v20];

      v22 = v7;
      if (!v21) {
        goto LABEL_12;
      }
      v23 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
      uint64_t v24 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
      goto LABEL_13;
    case 2:
LABEL_3:
      v12 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
      v13 = [(KCSharingMergeConflict *)self outgoingDatabaseItem];
      [(KCSharingIncomingEntry *)v12 addObject:v13];
      goto LABEL_14;
    case 3:
      v25 = [KCSharingIncomingEntry alloc];
      v26 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
      v12 = [(KCSharingIncomingRow *)v25 initWithIncomingDatabaseItem:v26 error:a4];

      if (!v12) {
        goto LABEL_16;
      }
      v27 = [KCSharingOutgoingEntry alloc];
      v28 = [(KCSharingMergeConflict *)self outgoingDatabaseItem];
      v13 = [(KCSharingOutgoingRow *)v27 initWithOutgoingDatabaseItem:v28 error:a4];

      if (!v13)
      {
LABEL_19:

        goto LABEL_20;
      }
      if ((id)[(KCSharingIncomingEntry *)v12 type] == (id)3)
      {
        v22 = v7;
LABEL_12:
        v29 = [(KCSharingDatabaseUpdatePlan *)v22 insertIntoLocalAndMirror];
        [v29 addObject:v12];

        v30 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
        v31 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
        [v30 addObject:v31];

        v23 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
        uint64_t v24 = [(KCSharingMergeConflict *)self outgoingDatabaseItem];
LABEL_13:
        v32 = (void *)v24;
        [v23 addObject:v24];

LABEL_14:
        goto LABEL_15;
      }
      v34 = [(KCSharingIncomingEntry *)v12 remoteItemWithAccessGroups:v6 error:a4];
      if (!v34)
      {
        int v44 = 1;
        goto LABEL_36;
      }
      v35 = [(KCSharingOutgoingDeletion *)v13 remoteItemWithAccessGroups:v6 error:a4];
      if (!v35)
      {
        int v44 = 1;
        goto LABEL_35;
      }
      if ([v34 isEqual:v35])
      {
        v36 = [KCSharingMirrorEntry alloc];
        v37 = [(KCSharingIncomingEntry *)v12 record];
        v38 = [(KCSharingMirrorEntry *)v36 initWithSavedRecord:v37 forOutgoingEntry:v13 flags:0];

        v39 = [(KCSharingDatabaseUpdatePlan *)v7 insertIntoMirror];
        [v39 addObject:v38];

        v40 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
        v41 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
        [v40 addObject:v41];

        v42 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
        v43 = [(KCSharingMergeConflict *)self outgoingDatabaseItem];
        [v42 addObject:v43];

        goto LABEL_34;
      }
      v63 = v35;
      v64 = v34;
      v45 = [(KCSharingIncomingEntry *)v12 record];
      v46 = [v45 recordChangeTag];
      v47 = [(KCSharingOutgoingDeletion *)v13 record];
      v48 = [v47 recordChangeTag];
      unsigned int v49 = [v46 isEqualToString:v48];

      if (v49)
      {
        v38 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
        uint64_t v50 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
LABEL_31:
        v42 = (void *)v50;
        [(KCSharingMirrorEntry *)v38 addObject:v50];
        goto LABEL_33;
      }
      v51 = [(KCSharingIncomingEntry *)v12 modificationDate];
      v52 = [(KCSharingOutgoingDeletion *)v13 modificationDate];
      id v53 = [v51 compare:v52];

      if (v53 != (id)-1)
      {
        v54 = [(KCSharingDatabaseUpdatePlan *)v7 insertIntoLocalAndMirror];
        [v54 addObject:v12];

        v55 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
        v56 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
        [v55 addObject:v56];

        v38 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
        uint64_t v50 = [(KCSharingMergeConflict *)self outgoingDatabaseItem];
        goto LABEL_31;
      }
      v57 = [KCSharingMirrorEntry alloc];
      v58 = [(KCSharingIncomingEntry *)v12 record];
      v38 = [(KCSharingMirrorEntry *)v57 initWithSavedRecord:v58 forOutgoingEntry:v13 flags:1];

      v59 = [(KCSharingDatabaseUpdatePlan *)v7 insertIntoMirror];
      [v59 addObject:v38];

      v60 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
      v61 = [(KCSharingMergeConflict *)self incomingDatabaseItem];
      [v60 addObject:v61];

      v42 = [(KCSharingDatabaseUpdatePlan *)v7 itemsToDelete];
      v62 = [(KCSharingMergeConflict *)self outgoingDatabaseItem];
      [v42 addObject:v62];

LABEL_33:
      v35 = v63;
      v34 = v64;
LABEL_34:

      int v44 = 2;
LABEL_35:

LABEL_36:
      if (v44 == 2)
      {
LABEL_15:
        v12 = v7;
        goto LABEL_16;
      }
LABEL_20:
      v12 = 0;
LABEL_16:

      return v12;
    default:
      goto LABEL_15;
  }
}

- (KCSharingMergeConflict)initWithRemotelyDeletedIncomingDatabaseItem:(SecDbItem *)a3 locallyDeletedOutgoingDatabaseItem:(SecDbItem *)a4 mirrorDatabaseItem:(SecDbItem *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)KCSharingMergeConflict;
  v8 = [(KCSharingMergeConflict *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = 0;
    objc_storeStrong(&v8->_incomingDatabaseItem, a3);
    objc_storeStrong(&v9->_outgoingDatabaseItem, a4);
    objc_storeStrong(&v9->_mirrorDatabaseItem, a5);
  }
  return v9;
}

- (KCSharingMergeConflict)initWithRemotelyDeletedIncomingDatabaseItem:(SecDbItem *)a3 locallyChangedOutgoingDatabaseItem:(SecDbItem *)a4 mirrorDatabaseItem:(SecDbItem *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)KCSharingMergeConflict;
  v8 = [(KCSharingMergeConflict *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = 2;
    objc_storeStrong(&v8->_incomingDatabaseItem, a3);
    objc_storeStrong(&v9->_outgoingDatabaseItem, a4);
    objc_storeStrong(&v9->_mirrorDatabaseItem, a5);
  }
  return v9;
}

- (KCSharingMergeConflict)initWithRemotelyChangedIncomingDatabaseItem:(SecDbItem *)a3 locallyChangedOutgoingDatabaseItem:(SecDbItem *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)KCSharingMergeConflict;
  id v6 = [(KCSharingMergeConflict *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong(&v6->_incomingDatabaseItem, a3);
    objc_storeStrong(&v7->_outgoingDatabaseItem, a4);
  }
  return v7;
}

- (KCSharingMergeConflict)initWithRemotelyChangedIncomingDatabaseItem:(SecDbItem *)a3 locallyDeletedOutgoingDatabaseItem:(SecDbItem *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)KCSharingMergeConflict;
  id v6 = [(KCSharingMergeConflict *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong(&v6->_incomingDatabaseItem, a3);
    objc_storeStrong(&v7->_outgoingDatabaseItem, a4);
  }
  return v7;
}

@end