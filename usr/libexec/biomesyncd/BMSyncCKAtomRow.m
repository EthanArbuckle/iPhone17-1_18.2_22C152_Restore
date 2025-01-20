@interface BMSyncCKAtomRow
- (BMSyncCKAtomRow)initWithFMResultSet:(id)a3;
- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 segmentName:(id)a8 segmentOffset:(unint64_t)a9;
- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 valueVersion:(int64_t)a8 valueData:(id)a9;
- (BMSyncCRDTLocationRow)location;
- (BMSyncCRDTLocationRow)referenceLocation;
- (BOOL)isEqual:(id)a3;
- (CKAtomReference)causalReference;
- (CKDistributedTimestamp)timestamp;
- (NSData)valueData;
- (NSString)segmentName;
- (id)description;
- (int64_t)valueVersion;
- (unint64_t)hash;
- (unint64_t)segmentOffset;
- (unint64_t)type;
@end

@implementation BMSyncCKAtomRow

- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 segmentName:(id)a8 segmentOffset:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v26 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2, self, @"BMSyncCKAtomRow.m", 62, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v23 = +[NSAssertionHandler currentHandler];
  [v23 handleFailureInMethod:a2, self, @"BMSyncCKAtomRow.m", 63, @"Invalid parameter not satisfying: %@", @"timestamp" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)BMSyncCKAtomRow;
  v19 = [(BMSyncCKAtomRow *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_location, a3);
    objc_storeStrong((id *)&v20->_timestamp, a4);
    objc_storeStrong((id *)&v20->_referenceLocation, a5);
    objc_storeStrong((id *)&v20->_causalReference, a6);
    v20->_type = a7;
    objc_storeStrong((id *)&v20->_segmentName, a8);
    v20->_segmentOffset = a9;
  }

  return v20;
}

- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 valueVersion:(int64_t)a8 valueData:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a9;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, self, @"BMSyncCKAtomRow.m", 87, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v22 = +[NSAssertionHandler currentHandler];
  [v22 handleFailureInMethod:a2, self, @"BMSyncCKAtomRow.m", 88, @"Invalid parameter not satisfying: %@", @"timestamp" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)BMSyncCKAtomRow;
  id v18 = [(BMSyncCKAtomRow *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_location, a3);
    objc_storeStrong((id *)&v19->_timestamp, a4);
    objc_storeStrong((id *)&v19->_referenceLocation, a5);
    objc_storeStrong((id *)&v19->_causalReference, a6);
    v19->_type = a7;
    v19->_valueVersion = a8;
    objc_storeStrong((id *)&v19->_valueData, a9);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if ([(BMSyncCRDTLocationRow *)self->_location isEqual:v5[1]]) {
      unsigned __int8 v6 = [(CKDistributedTimestamp *)self->_timestamp isEqual:v5[2]];
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BMSyncCRDTLocationRow *)self->_location hash];
  return (unint64_t)[(CKDistributedTimestamp *)self->_timestamp hash] ^ v3;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = sub_1000259F8(self->_type);
  unsigned __int8 v6 = [(BMSyncCRDTLocationRow *)self->_location description];
  v7 = [(CKDistributedTimestamp *)self->_timestamp bm_description];
  v8 = [(CKAtomReference *)self->_causalReference timestamp];
  v9 = [v8 bm_description];
  id v10 = [v3 initWithFormat:@"<%@: type=%@, location=%@, atomID=%@, refID=%@ bookmarkOffset=%lu>", v4, v5, v6, v7, v9, self->_segmentOffset];

  return v10;
}

- (BMSyncCRDTLocationRow)location
{
  return self->_location;
}

- (CKDistributedTimestamp)timestamp
{
  return self->_timestamp;
}

- (BMSyncCRDTLocationRow)referenceLocation
{
  return self->_referenceLocation;
}

- (CKAtomReference)causalReference
{
  return self->_causalReference;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (unint64_t)segmentOffset
{
  return self->_segmentOffset;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)valueVersion
{
  return self->_valueVersion;
}

- (NSData)valueData
{
  return self->_valueData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueData, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_causalReference, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (BMSyncCKAtomRow)initWithFMResultSet:(id)a3
{
  id v3 = a3;
  v31 = [v3 stringForColumn:@"stream"];
  uint64_t v4 = [v3 stringForColumn:@"site"];
  id v5 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v33 = v4;
  unsigned __int8 v6 = [v4 dataUsingEncoding:4];
  id v7 = [v5 initWithIdentifier:v6];

  id v8 = [v3 longForColumn:@"clock"];
  id v28 = [v3 longForColumn:@"type"];
  v32 = v7;
  id v9 = [objc_alloc((Class)CKDistributedTimestamp) initWithSiteIdentifierObject:v7 clockValue:v8];
  id v10 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v3 modifier:1];
  v11 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:v3 modifier:2];
  v29 = [(BMSyncCRDTLocationRow *)v11 location];
  uint64_t v12 = [v29 ckMergeableValueIDWithFormatVersion:0];
  unsigned __int8 v13 = [v3 longForColumn:@"ref_type"];
  id v14 = [v3 stringForColumn:@"ref_site"];
  id v15 = objc_alloc((Class)CKDistributedSiteIdentifier);
  id v26 = v14;
  id v16 = [v14 dataUsingEncoding:4];
  id v17 = [v15 initWithIdentifier:v16];

  id v18 = [objc_alloc((Class)CKDistributedTimestamp) initWithSiteIdentifierObject:v17 clockValue:[v3 longForColumn:@"ref_clock"]];
  if (v12) {
    id v19 = [objc_alloc((Class)CKAtomReference) initWithMergeableValueID:v12 timestamp:v18 type:v13];
  }
  else {
    id v19 = 0;
  }
  objc_super v27 = (void *)v12;
  v20 = [v3 stringForColumn:@"segment_name"];
  v21 = v10;
  if (v20)
  {
    v22 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](self, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v10, v9, v11, v19, v28, v20, [v3 longForColumn:@"segment_offset"]);
  }
  else
  {
    id v23 = [v3 longForColumn:@"value_version"];
    v24 = [v3 dataForColumn:@"value_data"];
    v22 = [(BMSyncCKAtomRow *)self initWithLocation:v21 timestamp:v9 referenceLocation:v11 causalReference:v19 type:v28 valueVersion:v23 valueData:v24];
  }
  return v22;
}

@end