@interface ICTableAttachmentSelection
- (BOOL)draggingText;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRangeOrSpanningSelection;
- (BOOL)moving;
- (BOOL)removeColumns:(id)a3 rows:(id)a4;
- (BOOL)removeColumns:(id)a3 rows:(id)a4 previousColumns:(id)a5 previousRows:(id)a6;
- (BOOL)valid;
- (ICTableAttachmentSelection)init;
- (NSArray)columns;
- (NSArray)rows;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)selectCellAtColumn:(id)a3 row:(id)a4;
- (void)selectCellRangeAtColumns:(id)a3 rows:(id)a4;
- (void)selectColumns:(id)a3;
- (void)selectRows:(id)a3;
- (void)setColumns:(id)a3;
- (void)setDraggingText:(BOOL)a3;
- (void)setMoving:(BOOL)a3;
- (void)setRows:(id)a3;
- (void)setSelectionEqualTo:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)unselect;
@end

@implementation ICTableAttachmentSelection

- (ICTableAttachmentSelection)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICTableAttachmentSelection;
  v2 = [(ICTableAttachmentSelection *)&v8 init];
  v3 = v2;
  if (v2)
  {
    columns = v2->_columns;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_type = 0;
    v2->_columns = v5;

    rows = v3->_rows;
    v3->_rows = v5;
  }
  return v3;
}

- (BOOL)isRangeOrSpanningSelection
{
  return [(ICTableAttachmentSelection *)self type] > 1;
}

- (BOOL)valid
{
  switch([(ICTableAttachmentSelection *)self type])
  {
    case 0uLL:
      return 1;
    case 1uLL:
      v5 = [(ICTableAttachmentSelection *)self columns];
      if ([v5 count] != 1) {
        goto LABEL_12;
      }
      v6 = [(ICTableAttachmentSelection *)self rows];
      BOOL v3 = [v6 count] == 1;
      goto LABEL_11;
    case 2uLL:
      v4 = [(ICTableAttachmentSelection *)self columns];
      goto LABEL_5;
    case 3uLL:
      v4 = [(ICTableAttachmentSelection *)self rows];
LABEL_5:
      v5 = v4;
      BOOL v3 = [v4 count] != 0;
      goto LABEL_13;
    case 4uLL:
      v5 = [(ICTableAttachmentSelection *)self columns];
      if ([v5 count])
      {
        v6 = [(ICTableAttachmentSelection *)self rows];
        BOOL v3 = [v6 count] != 0;
LABEL_11:
      }
      else
      {
LABEL_12:
        BOOL v3 = 0;
      }
LABEL_13:

      break;
    default:
      BOOL v3 = 0;
      break;
  }
  return v3;
}

- (void)unselect
{
  if (![(ICTableAttachmentSelection *)self type])
  {
    BOOL v3 = [(ICTableAttachmentSelection *)self rows];
    if ([v3 count])
    {
    }
    else
    {
      v4 = [(ICTableAttachmentSelection *)self columns];
      uint64_t v5 = [v4 count];

      if (!v5) {
        return;
      }
    }
  }
  [(ICTableAttachmentSelection *)self setType:0];
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  [(ICTableAttachmentSelection *)self setColumns:MEMORY[0x1E4F1CBF0]];
  [(ICTableAttachmentSelection *)self setRows:v6];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICTableAttachmentSelectionDidChangeNotification" object:self];
}

- (void)selectCellAtColumn:(id)a3 row:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (!v6 || !v7) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICTableAttachmentSelection selectCellAtColumn:row:]" simulateCrash:1 showAlert:0 format:@"We tried to select a cell without a row or column"];
  }
  if ([(ICTableAttachmentSelection *)self type] == 1)
  {
    v9 = [(ICTableAttachmentSelection *)self rows];
    v20[0] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    if ([v9 isEqualToArray:v10])
    {
      v11 = [(ICTableAttachmentSelection *)self columns];
      id v19 = v6;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      char v13 = [v11 isEqualToArray:v12];

      if (v13) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  [(ICTableAttachmentSelection *)self setType:1];
  id v18 = v6;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [(ICTableAttachmentSelection *)self setColumns:v14];

  v17 = v8;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [(ICTableAttachmentSelection *)self setRows:v15];

  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotificationName:@"ICTableAttachmentSelectionDidChangeNotification" object:self];

LABEL_10:
}

- (void)selectColumns:(id)a3
{
  id v8 = a3;
  if ([(ICTableAttachmentSelection *)self type] == 2)
  {
    v4 = [(ICTableAttachmentSelection *)self rows];
    if ([v4 count])
    {
    }
    else
    {
      uint64_t v5 = [(ICTableAttachmentSelection *)self columns];
      char v6 = [v5 isEqualToArray:v8];

      if (v6) {
        goto LABEL_6;
      }
    }
  }
  [(ICTableAttachmentSelection *)self setType:2];
  [(ICTableAttachmentSelection *)self setColumns:v8];
  [(ICTableAttachmentSelection *)self setRows:MEMORY[0x1E4F1CBF0]];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICTableAttachmentSelectionDidChangeNotification" object:self];

LABEL_6:
}

- (void)selectRows:(id)a3
{
  id v8 = a3;
  if ([(ICTableAttachmentSelection *)self type] == 3)
  {
    v4 = [(ICTableAttachmentSelection *)self columns];
    if ([v4 count])
    {
    }
    else
    {
      uint64_t v5 = [(ICTableAttachmentSelection *)self rows];
      char v6 = [v5 isEqualToArray:v8];

      if (v6) {
        goto LABEL_6;
      }
    }
  }
  [(ICTableAttachmentSelection *)self setType:3];
  [(ICTableAttachmentSelection *)self setColumns:MEMORY[0x1E4F1CBF0]];
  [(ICTableAttachmentSelection *)self setRows:v8];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICTableAttachmentSelectionDidChangeNotification" object:self];

LABEL_6:
}

- (void)selectCellRangeAtColumns:(id)a3 rows:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([(ICTableAttachmentSelection *)self type] != 4) {
    goto LABEL_6;
  }
  id v7 = [(ICTableAttachmentSelection *)self columns];
  if (([v7 isEqualToArray:v11] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v8 = [(ICTableAttachmentSelection *)self rows];
  char v9 = [v8 isEqualToArray:v6];

  if ((v9 & 1) == 0)
  {
LABEL_6:
    [(ICTableAttachmentSelection *)self setType:4];
    [(ICTableAttachmentSelection *)self setColumns:v11];
    [(ICTableAttachmentSelection *)self setRows:v6];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"ICTableAttachmentSelectionDidChangeNotification" object:self];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    uint64_t v5 = ICDynamicCast();
    unint64_t v6 = [(ICTableAttachmentSelection *)self type];
    if (v6 == [v5 type])
    {
      id v7 = [(ICTableAttachmentSelection *)self columns];
      id v8 = [v5 columns];
      if ([v7 isEqual:v8])
      {
        char v9 = [(ICTableAttachmentSelection *)self rows];
        v10 = [v5 rows];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[ICTableAttachmentSelection allocWithZone:](ICTableAttachmentSelection, "allocWithZone:") init];
  [(ICTableAttachmentSelection *)v5 setType:[(ICTableAttachmentSelection *)self type]];
  unint64_t v6 = [(ICTableAttachmentSelection *)self columns];
  id v7 = (void *)[v6 copyWithZone:a3];
  [(ICTableAttachmentSelection *)v5 setColumns:v7];

  id v8 = [(ICTableAttachmentSelection *)self rows];
  char v9 = (void *)[v8 copyWithZone:a3];
  [(ICTableAttachmentSelection *)v5 setRows:v9];

  [(ICTableAttachmentSelection *)v5 setMoving:[(ICTableAttachmentSelection *)self moving]];
  [(ICTableAttachmentSelection *)v5 setDraggingText:[(ICTableAttachmentSelection *)self draggingText]];
  return v5;
}

- (void)setSelectionEqualTo:(id)a3
{
  id v4 = a3;
  -[ICTableAttachmentSelection setType:](self, "setType:", [v4 type]);
  uint64_t v5 = [v4 columns];
  [(ICTableAttachmentSelection *)self setColumns:v5];

  unint64_t v6 = [v4 rows];
  [(ICTableAttachmentSelection *)self setRows:v6];

  -[ICTableAttachmentSelection setMoving:](self, "setMoving:", [v4 moving]);
  uint64_t v7 = [v4 draggingText];

  [(ICTableAttachmentSelection *)self setDraggingText:v7];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"ICTableAttachmentSelectionDidChangeNotification" object:self];
}

- (BOOL)removeColumns:(id)a3 rows:(id)a4 previousColumns:(id)a5 previousRows:(id)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v37 = a6;
  char v13 = [(ICTableAttachmentSelection *)self columns];
  v14 = [(ICTableAttachmentSelection *)self rows];
  v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];
  v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v14];
  [v15 removeObjectsInArray:v10];
  [v16 removeObjectsInArray:v11];
  v17 = (void *)[v15 copy];
  [(ICTableAttachmentSelection *)self setColumns:v17];

  id v18 = (void *)[v16 copy];
  [(ICTableAttachmentSelection *)self setRows:v18];

  id v19 = [(ICTableAttachmentSelection *)self columns];
  uint64_t v20 = [v19 count];

  if (!v20)
  {
    v35 = v12;
    v21 = [v12 firstObjectCommonWithArray:v10];
    if (!v21)
    {
LABEL_9:

      id v12 = v35;
      goto LABEL_10;
    }
    uint64_t v22 = [v35 indexOfObject:v21];
    if (v22)
    {
      v23 = [v35 objectAtIndexedSubscript:v22 - 1];
      v39[0] = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    }
    else
    {
      v23 = (void *)[v35 mutableCopy];
      [v23 removeObjectsInArray:v10];
      if (![v23 count])
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v24 = objc_msgSend(v23, "subarrayWithRange:", 0, 1);
    }
    v25 = (void *)v24;
    [(ICTableAttachmentSelection *)self setColumns:v24];

    goto LABEL_8;
  }
LABEL_10:
  v26 = [(ICTableAttachmentSelection *)self rows];
  uint64_t v27 = [v26 count];

  if (!v27)
  {
    id v36 = v12;
    v28 = [v37 firstObjectCommonWithArray:v11];
    if (!v28)
    {
LABEL_18:

      id v12 = v36;
      goto LABEL_19;
    }
    uint64_t v29 = [v37 indexOfObject:v28];
    if (v29)
    {
      v30 = [v37 objectAtIndexedSubscript:v29 - 1];
      v38 = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    }
    else
    {
      v30 = (void *)[v37 mutableCopy];
      [v30 removeObjectsInArray:v11];
      if (![v30 count])
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v31 = objc_msgSend(v30, "subarrayWithRange:", 0, 1);
    }
    v32 = (void *)v31;
    [(ICTableAttachmentSelection *)self setRows:v31];

    goto LABEL_17;
  }
LABEL_19:
  v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v33 postNotificationName:@"ICTableAttachmentSelectionDidChangeNotification" object:self];

  LOBYTE(v33) = [(ICTableAttachmentSelection *)self valid];
  return (char)v33;
}

- (BOOL)removeColumns:(id)a3 rows:(id)a4
{
  return [(ICTableAttachmentSelection *)self removeColumns:a3 rows:a4 previousColumns:MEMORY[0x1E4F1CBF0] previousRows:MEMORY[0x1E4F1CBF0]];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (BOOL)moving
{
  return self->_moving;
}

- (void)setMoving:(BOOL)a3
{
  self->_moving = a3;
}

- (BOOL)draggingText
{
  return self->_draggingText;
}

- (void)setDraggingText:(BOOL)a3
{
  self->_draggingText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

@end