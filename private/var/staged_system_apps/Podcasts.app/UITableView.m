@interface UITableView
- (BOOL)_hasRowAtIndexPath:(id)a3 focusable:(BOOL)a4;
- (BOOL)canFocusRowAtIndexPath:(id)a3;
- (BOOL)hasRowAtIndexPath:(id)a3;
- (BOOL)hasRowsInSectionAtIndex:(int64_t)a3;
- (id)_indexPathForClosestRowToIndexPath:(id)a3 focusable:(BOOL)a4;
- (id)_indexPathForRowAfterIndexPath:(id)a3 focusable:(BOOL)a4;
- (id)_indexPathForRowBeforeIndexPath:(id)a3 focusable:(BOOL)a4;
- (id)distanceFromIndexPath:(id)a3 toIndexPath:(id)a4;
- (id)indexPathForClosestFocusableRowToIndexPath:(id)a3;
- (id)indexPathForClosestRowToIndexPath:(id)a3;
- (id)indexPathForFirstFocusableRow;
- (id)indexPathForFirstRow;
- (id)indexPathForFirstRowInSection:(int64_t)a3;
- (id)indexPathForFocusableRowAfterIndexPath:(id)a3;
- (id)indexPathForFocusableRowBeforeIndexPath:(id)a3;
- (id)indexPathForLastRow;
- (id)indexPathForLastRowInSection:(int64_t)a3;
- (id)indexPathForRowAfterIndexPath:(id)a3;
- (id)indexPathForRowBeforeIndexPath:(id)a3;
- (unint64_t)numberOfRowsFromIndexPath:(id)a3 toFromIndexPath:(id)a4;
@end

@implementation UITableView

- (BOOL)hasRowAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  BOOL v8 = 0;
  if (v4)
  {
    if (((unint64_t)[v4 section] & 0x8000000000000000) == 0
      && ((unint64_t)[v5 row] & 0x8000000000000000) == 0)
    {
      id v6 = [v5 section];
      if ((uint64_t)v6 < [(UITableView *)self numberOfSections])
      {
        id v7 = [v5 row];
        if ((uint64_t)v7 < -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", [v5 section]))BOOL v8 = 1; {
      }
        }
    }
  }

  return v8;
}

- (BOOL)hasRowsInSectionAtIndex:(int64_t)a3
{
  return [(UITableView *)self numberOfSections] > a3
      && [(UITableView *)self numberOfRowsInSection:a3] > 0;
}

- (BOOL)canFocusRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(UITableView *)self hasRowAtIndexPath:v4])
  {
    v5 = [(UITableView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(UITableView *)self delegate];
      unsigned __int8 v8 = [v7 tableView:self canFocusRowAtIndexPath:v4];
    }
    else
    {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)indexPathForFirstRow
{
  uint64_t v3 = [(UITableView *)self numberOfSections];
  if (v3 < 1)
  {
LABEL_5:
    char v6 = 0;
  }
  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    while ([(UITableView *)self numberOfRowsInSection:v5] < 1)
    {
      if (v4 == ++v5) {
        goto LABEL_5;
      }
    }
    char v6 = +[NSIndexPath indexPathForRow:0 inSection:v5];
  }

  return v6;
}

- (id)indexPathForLastRow
{
  uint64_t v3 = [(UITableView *)self numberOfSections];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    while (v4-- >= 1)
    {
      uint64_t v6 = [(UITableView *)self numberOfRowsInSection:v4];
      if (v6 >= 1)
      {
        uint64_t v3 = +[NSIndexPath indexPathForRow:v6 - 1 inSection:v4];
        goto LABEL_7;
      }
    }
    uint64_t v3 = 0;
  }
LABEL_7:

  return v3;
}

- (id)indexPathForFirstRowInSection:(int64_t)a3
{
  uint64_t v4 = +[NSIndexPath indexPathForRow:0 inSection:a3];
  if (![(UITableView *)self hasRowAtIndexPath:v4])
  {

    uint64_t v4 = 0;
  }

  return v4;
}

- (id)indexPathForLastRowInSection:(int64_t)a3
{
  if (-[UITableView hasRowsInSectionAtIndex:](self, "hasRowsInSectionAtIndex:"))
  {
    uint64_t v5 = +[NSIndexPath indexPathForRow:(char *)[(UITableView *)self numberOfRowsInSection:a3] - 1 inSection:a3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)indexPathForFirstFocusableRow
{
  if ([(UITableView *)self numberOfSections] < 1)
  {
LABEL_10:
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v3 = 0;
    while (1)
    {
      if ([(UITableView *)self numberOfRowsInSection:v3] >= 1)
      {
        uint64_t v4 = 0;
        while (1)
        {
          uint64_t v5 = +[NSIndexPath indexPathForRow:v4 inSection:v3];
          if ([(UITableView *)self canFocusRowAtIndexPath:v5]) {
            break;
          }

          if (++v4 >= [(UITableView *)self numberOfRowsInSection:v3]) {
            goto LABEL_9;
          }
        }
        if (v5) {
          break;
        }
      }
LABEL_9:
      if (++v3 >= [(UITableView *)self numberOfSections]) {
        goto LABEL_10;
      }
    }
  }

  return v5;
}

- (id)indexPathForRowBeforeIndexPath:(id)a3
{
  id v4 = a3;
  if ([(UITableView *)self numberOfSections])
  {
    if (v4)
    {
      uint64_t v5 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v4 row] - 1, objc_msgSend(v4, "section"));
      if (![(UITableView *)self hasRowAtIndexPath:v5])
      {
        uint64_t v6 = (char *)[v4 section] + 1;
        while ((uint64_t)--v6 >= 1)
        {
          uint64_t v7 = -[UITableView indexPathForLastRowInSection:](self, "indexPathForLastRowInSection:", [v4 section]);

          uint64_t v5 = 0;
          if (v7)
          {
            uint64_t v5 = (void *)v7;
            break;
          }
        }
      }
    }
    else
    {
      uint64_t v5 = [(UITableView *)self indexPathForFirstRow];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)indexPathForFocusableRowBeforeIndexPath:(id)a3
{
  id v4 = a3;
  if (v4
    && [(UITableView *)self numberOfSections]
    && (unint64_t v5 = (unint64_t)[v4 section], (v5 & 0x8000000000000000) == 0))
  {
    uint64_t v6 = (char *)v5;
    while (v6 == [v4 section])
    {
      uint64_t v7 = (uint64_t)[v4 row];
      uint64_t v8 = v7 - 1;
      if (v7 >= 1) {
        goto LABEL_9;
      }
LABEL_12:
      v9 = 0;
      BOOL v10 = (uint64_t)v6-- <= 0;
      if (v10) {
        goto LABEL_16;
      }
    }
    uint64_t v8 = 0;
LABEL_9:
    while (1)
    {
      v9 = +[NSIndexPath indexPathForRow:v8 inSection:v6];
      if ([(UITableView *)self canFocusRowAtIndexPath:v9]) {
        break;
      }

      BOOL v10 = v8-- <= 0;
      if (v10) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (id)indexPathForRowAfterIndexPath:(id)a3
{
  id v4 = a3;
  if ([(UITableView *)self numberOfSections])
  {
    if (v4)
    {
      unint64_t v5 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v4 row] + 1, objc_msgSend(v4, "section"));
      if (![(UITableView *)self hasRowAtIndexPath:v5])
      {
        uint64_t v6 = (char *)[v4 section] + 1;
        while ((uint64_t)v6 < [(UITableView *)self numberOfSections])
        {
          uint64_t v7 = [(UITableView *)self indexPathForFirstRowInSection:v6];

          unint64_t v5 = 0;
          ++v6;
          if (v7)
          {
            unint64_t v5 = (void *)v7;
            break;
          }
        }
      }
    }
    else
    {
      unint64_t v5 = [(UITableView *)self indexPathForFirstRow];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)indexPathForFocusableRowAfterIndexPath:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = -[UITableView numberOfSections](self, "numberOfSections"), (uint64_t)[v4 section] < v5)
    && (uint64_t v6 = (char *)[v4 section], (uint64_t)v6 < v5))
  {
    uint64_t v7 = v6;
    while (1)
    {
      NSInteger v8 = [(UITableView *)self numberOfRowsInSection:v7];
      v9 = v7 == [v4 section] ? (char *)[v4 row] + 1 : 0;
      if ((uint64_t)v9 < v8) {
        break;
      }
LABEL_11:
      BOOL v10 = 0;
      if (++v7 == (char *)v5) {
        goto LABEL_14;
      }
    }
    while (1)
    {
      BOOL v10 = +[NSIndexPath indexPathForRow:v9 inSection:v7];
      if ([(UITableView *)self canFocusRowAtIndexPath:v10]) {
        break;
      }

      if ((char *)v8 == ++v9) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_14:

  return v10;
}

- (id)indexPathForClosestRowToIndexPath:(id)a3
{
  return [(UITableView *)self _indexPathForClosestRowToIndexPath:a3 focusable:0];
}

- (id)indexPathForClosestFocusableRowToIndexPath:(id)a3
{
  return [(UITableView *)self _indexPathForClosestRowToIndexPath:a3 focusable:1];
}

- (id)distanceFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  uint64_t v5 = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    id v8 = a3;
    v9 = [v7 section];
    BOOL v10 = [v8 section];
    if (v9 - v10 >= 0) {
      int64_t v11 = v9 - v10;
    }
    else {
      int64_t v11 = v10 - v9;
    }
    unint64_t v12 = [(UITableView *)self numberOfRowsFromIndexPath:v8 toFromIndexPath:v7];

    uint64_t v5 = +[NSIndexPath indexPathForRow:v12 inSection:v11];
  }

  return v5;
}

- (unint64_t)numberOfRowsFromIndexPath:(id)a3 toFromIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = [v6 compare:v7];
    BOOL v10 = v6;
    int64_t v11 = v8;
    if (v9 != (id)-1)
    {
      if (v9 != (id)1)
      {
        v15 = 0;
        id v12 = 0;
        id v13 = 0;
        goto LABEL_23;
      }
      BOOL v10 = v8;
      int64_t v11 = v6;
    }
    id v12 = v10;
    id v13 = v11;
    v14 = (char *)[v12 section];
    if ((uint64_t)v14 > (uint64_t)[v13 section])
    {
      v15 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v15 = 0;
    while (1)
    {
      if ([(UITableView *)self hasRowsInSectionAtIndex:v14])
      {
        v16 = (char *)[v13 section];
        v17 = (char *)[v12 section];
        v18 = v17;
        if (v14 == v16)
        {
          id v19 = [v13 row];
          id v20 = v19;
          if (v14 != v18)
          {
            v15 = &v15[(void)v19];
            goto LABEL_22;
          }
          v21 = [v12 row];
          v22 = &v15[(void)v20];
        }
        else
        {
          if (v14 != v17)
          {
            v15 = &v15[[(UITableView *)self numberOfRowsInSection:v14]];
            goto LABEL_22;
          }
          NSInteger v23 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", [v12 section]);
          v21 = [v12 row];
          v22 = &v15[v23];
        }
        v15 = (char *)(v22 - v21);
      }
LABEL_22:
      if ((uint64_t)v14++ >= (uint64_t)[v13 section]) {
        goto LABEL_23;
      }
    }
  }
  if (v6) {
    id v7 = v6;
  }
  v15 = (char *)[v7 row];
LABEL_24:

  return (unint64_t)v15;
}

- (id)_indexPathForClosestRowToIndexPath:(id)a3 focusable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(UITableView *)self _hasRowAtIndexPath:v6 focusable:v4])
  {
    id v7 = v6;
    goto LABEL_21;
  }
  uint64_t v8 = [(UITableView *)self _indexPathForRowBeforeIndexPath:v6 focusable:v4];
  uint64_t v9 = [(UITableView *)self _indexPathForRowAfterIndexPath:v6 focusable:v4];
  BOOL v10 = (void *)v9;
  if (v9 | v8)
  {
    if ((v8 != 0) != (v9 != 0))
    {
      BOOL v11 = v9 == 0;
LABEL_16:
      if (v11) {
        id v20 = (void *)v8;
      }
      else {
        id v20 = v10;
      }
      id v7 = v20;
      goto LABEL_20;
    }
    if (v9)
    {
      id v12 = [(id)v9 section];
      int v13 = v12 == [v6 section];
      if (v8)
      {
LABEL_9:
        id v14 = [(id)v8 section];
        int v15 = v14 == [v6 section];
        goto LABEL_12;
      }
    }
    else
    {
      int v13 = 0;
      if (v8) {
        goto LABEL_9;
      }
    }
    int v15 = 0;
LABEL_12:
    if (v15 == v13)
    {
      v16 = [(UITableView *)self indexPathsForVisibleRows];
      unsigned int v17 = [v16 containsObject:v10];

      v18 = [(UITableView *)self indexPathsForVisibleRows];
      unsigned int v19 = [v18 containsObject:v8];

      if (v17 == v19)
      {
        v22 = [(UITableView *)self distanceFromIndexPath:v6 toIndexPath:v8];
        NSInteger v23 = [(UITableView *)self distanceFromIndexPath:v6 toIndexPath:v10];
        id v24 = [v23 row];
        if ((uint64_t)v24 >= (uint64_t)[v22 row]) {
          v25 = (void *)v8;
        }
        else {
          v25 = v10;
        }
        id v7 = v25;

        goto LABEL_20;
      }
      BOOL v11 = v17 == 0;
    }
    else
    {
      BOOL v11 = v13 == 0;
    }
    goto LABEL_16;
  }
  id v7 = 0;
LABEL_20:

LABEL_21:

  return v7;
}

- (id)_indexPathForRowAfterIndexPath:(id)a3 focusable:(BOOL)a4
{
  if (a4) {
    [(UITableView *)self indexPathForFocusableRowAfterIndexPath:a3];
  }
  else {
  BOOL v4 = [(UITableView *)self indexPathForRowAfterIndexPath:a3];
  }

  return v4;
}

- (id)_indexPathForRowBeforeIndexPath:(id)a3 focusable:(BOOL)a4
{
  if (a4) {
    [(UITableView *)self indexPathForFocusableRowBeforeIndexPath:a3];
  }
  else {
  BOOL v4 = [(UITableView *)self indexPathForRowBeforeIndexPath:a3];
  }

  return v4;
}

- (BOOL)_hasRowAtIndexPath:(id)a3 focusable:(BOOL)a4
{
  if (a4) {
    return [(UITableView *)self canFocusRowAtIndexPath:a3];
  }
  else {
    return [(UITableView *)self hasRowAtIndexPath:a3];
  }
}

@end