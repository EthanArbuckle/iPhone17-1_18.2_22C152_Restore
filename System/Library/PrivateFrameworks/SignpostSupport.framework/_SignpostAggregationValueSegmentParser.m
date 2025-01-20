@interface _SignpostAggregationValueSegmentParser
- (BOOL)telemetryEnabled;
- (NSNumber)value;
- (NSString)group;
- (NSString)type;
- (NSString)unit;
- (id)processSegment:(id)a3 placeholderType:(unsigned __int8)a4;
- (void)_clearFields;
- (void)setGroup:(id)a3;
- (void)setTelemetryEnabled:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setUnit:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _SignpostAggregationValueSegmentParser

- (void)_clearFields
{
  [(_SignpostAggregationValueSegmentParser *)self setGroup:0];
  [(_SignpostAggregationValueSegmentParser *)self setType:0];
  [(_SignpostAggregationValueSegmentParser *)self setValue:0];
  [(_SignpostAggregationValueSegmentParser *)self setUnit:0];

  [(_SignpostAggregationValueSegmentParser *)self setTelemetryEnabled:0];
}

- (id)processSegment:(id)a3 placeholderType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v4 > 0xD)
  {
    BOOL v11 = 0;
  }
  else
  {
    if (((1 << v4) & 0x3003) != 0)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected placeholder type: %u", v4);
      v10 = [v8 errorWithCode:9 description:v9];

      goto LABEL_49;
    }
    BOOL v11 = ((1 << v4) & 0xC) != 0;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v50 = v6;
  id obj = [v6 placeholderTokens];
  uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v12) {
    goto LABEL_28;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v53;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v53 != v14) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      if ([v16 isEqualToString:@"telemetry=enabled"])
      {
        if (v11)
        {
          if (![(_SignpostAggregationValueSegmentParser *)self telemetryEnabled])
          {
            [(_SignpostAggregationValueSegmentParser *)self setTelemetryEnabled:1];
            continue;
          }
          [(_SignpostAggregationValueSegmentParser *)self _clearFields];
          v33 = (void *)MEMORY[0x1E4F28C58];
          objc_msgSend(NSString, "stringWithFormat:", @"Duplicate telemetry enabled placeholder token for type: %u", v4);
        }
        else
        {
          [(_SignpostAggregationValueSegmentParser *)self _clearFields];
          v33 = (void *)MEMORY[0x1E4F28C58];
          objc_msgSend(NSString, "stringWithFormat:", @"Unexpected telemetry enabled placeholder token for type: %u", v4);
        v18 = };
        v10 = [v33 errorWithCode:9 description:v18];
        v7 = v50;
        goto LABEL_48;
      }
      v17 = _stringAfterPrefix(v16, @"group=");
      if (v17)
      {
        v18 = v17;
        v19 = _checkTokenString(v17);
        if (v19) {
          goto LABEL_40;
        }
        v20 = [(_SignpostAggregationValueSegmentParser *)self group];

        if (v20)
        {
          v35 = NSString;
          v7 = v50;
          v36 = [v50 type];
          v37 = [v35 stringWithFormat:@"Duplicate groups for placeholder type '%@'", v36];

          [(_SignpostAggregationValueSegmentParser *)self _clearFields];
          v10 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v37];

          goto LABEL_47;
        }
        [(_SignpostAggregationValueSegmentParser *)self setGroup:v18];
      }
      else
      {
        v21 = _stringAfterPrefix(v16, @"type=");
        if (v21)
        {
          v18 = v21;
          v19 = _checkTokenString(v21);
          if (v19)
          {
LABEL_40:
            [(_SignpostAggregationValueSegmentParser *)self _clearFields];
            v10 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v19];
            v7 = v50;
            goto LABEL_47;
          }
          v22 = [(_SignpostAggregationValueSegmentParser *)self type];

          if (v22)
          {
            [(_SignpostAggregationValueSegmentParser *)self _clearFields];
            v43 = NSString;
            v7 = v50;
            v44 = [v50 type];
            v45 = [v43 stringWithFormat:@"Duplicate types for placeholder type '%@'", v44];

            v10 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v45];

LABEL_47:
LABEL_48:

            goto LABEL_49;
          }
          [(_SignpostAggregationValueSegmentParser *)self setType:v18];
        }
        else
        {
          v18 = _stringAfterPrefix(v16, @"measure_unit=");
          if (v18)
          {
            v23 = [(_SignpostAggregationValueSegmentParser *)self unit];

            if (v23)
            {
              [(_SignpostAggregationValueSegmentParser *)self _clearFields];
              v47 = NSString;
              v7 = v50;
              v48 = [v50 type];
              v49 = [v47 stringWithFormat:@"Duplicate units for placeholder type '%@'", v48];

              v10 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v49];

              goto LABEL_48;
            }
            [(_SignpostAggregationValueSegmentParser *)self setUnit:v18];
          }
        }
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_28:

  v24 = [(_SignpostAggregationValueSegmentParser *)self group];

  if (!v24)
  {
    [(_SignpostAggregationValueSegmentParser *)self _clearFields];
    v34 = NSString;
    v7 = v50;
    v32 = [v50 type];
    [v34 stringWithFormat:@"Missing group token for placeholder type '%@'", v32];
    v40 = LABEL_44:;

    v10 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v40];

    goto LABEL_49;
  }
  v25 = [(_SignpostAggregationValueSegmentParser *)self type];

  v7 = v50;
  if (!v25)
  {
    [(_SignpostAggregationValueSegmentParser *)self _clearFields];
    v38 = NSString;
    v32 = [v50 type];
    [v38 stringWithFormat:@"Missing type token for placeholder type '%@'", v32];
    goto LABEL_44;
  }
  v26 = [v50 argument];
  int v27 = [v26 type];

  if (v27 != 3)
  {
    [(_SignpostAggregationValueSegmentParser *)self _clearFields];
    v39 = NSString;
    v32 = [v50 type];
    [v39 stringWithFormat:@"Invalid (non-number) argument type for placeholder type '%@'", v32];
    goto LABEL_44;
  }
  if (processSegment_placeholderType__onceToken != -1) {
    dispatch_once(&processSegment_placeholderType__onceToken, &__block_literal_global_20);
  }
  v28 = (void *)processSegment_placeholderType__kNanNumber;
  v29 = [v50 argument];
  v30 = [v29 argumentObject];
  LODWORD(v28) = [v28 isEqualToNumber:v30];

  if (v28)
  {
    [(_SignpostAggregationValueSegmentParser *)self _clearFields];
    v31 = NSString;
    v32 = [v50 type];
    [v31 stringWithFormat:@"Invalid NaN encountered for value of placeholder type '%@'", v32];
    goto LABEL_44;
  }
  v41 = [v50 argument];
  v42 = [v41 argumentObject];
  [(_SignpostAggregationValueSegmentParser *)self setValue:v42];

  v10 = 0;
LABEL_49:

  return v10;
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (void)setTelemetryEnabled:(BOOL)a3
{
  self->_telemetryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end