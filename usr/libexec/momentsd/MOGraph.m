@interface MOGraph
- (MOGraph)initWithNumVertices:(unint64_t)a3 edges:(id)a4;
- (NSArray)edges;
- (NSMutableArray)membership;
- (NSMutableDictionary)sparseAdjacencyMatrix;
- (id)calculateConnectedComponentWithGraphTraversal:(unint64_t)a3;
- (unint64_t)numVertices;
- (void)bfsStartingFrom:(id)a3 connectedPartIndx:(id)a4;
- (void)dfsStartingFrom:(id)a3 connectedPartIndx:(id)a4;
- (void)setEdges:(id)a3;
- (void)setMembership:(id)a3;
- (void)setNumVertices:(unint64_t)a3;
- (void)setSparseAdjacencyMatrix:(id)a3;
@end

@implementation MOGraph

- (MOGraph)initWithNumVertices:(unint64_t)a3 edges:(id)a4
{
  id v8 = a4;
  v9 = v8;
  if (!a3)
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MOGraph initWithNumVertices:edges:]();
    }

    v35 = +[NSAssertionHandler currentHandler];
    v36 = v35;
    CFStringRef v37 = @"Invalid parameter not satisfying: numVertices > 0";
    SEL v38 = a2;
    v39 = self;
    uint64_t v40 = 18;
    goto LABEL_23;
  }
  if (!v8)
  {
    v41 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[MOGraph initWithNumVertices:edges:]();
    }

    v35 = +[NSAssertionHandler currentHandler];
    v36 = v35;
    CFStringRef v37 = @"Invalid parameter not satisfying: edges";
    SEL v38 = a2;
    v39 = self;
    uint64_t v40 = 19;
LABEL_23:
    [v35 handleFailureInMethod:v38 object:v39 file:@"MOGraph.m" lineNumber:v40 description:v37];

    v33 = 0;
    goto LABEL_24;
  }
  if ([v8 count])
  {
    uint64_t v10 = 0;
    while (1)
    {
      v11 = [v9 objectAtIndexedSubscript:v10];
      v12 = [v11 objectAtIndexedSubscript:0];
      unsigned int v13 = [v12 intValue];

      if ((v13 & 0x80000000) != 0) {
        break;
      }
      v14 = [v9 objectAtIndexedSubscript:v10];
      v15 = [v14 objectAtIndexedSubscript:0];
      unint64_t v16 = (int)[v15 intValue];

      if (v16 >= a3)
      {
        v44 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[MOGraph initWithNumVertices:edges:].cold.5();
        }

        v35 = +[NSAssertionHandler currentHandler];
        v36 = v35;
        CFStringRef v37 = @"Invalid parameter not satisfying: edges[i][0].intValue < numVertices";
        SEL v38 = a2;
        v39 = self;
        uint64_t v40 = 22;
        goto LABEL_23;
      }
      v17 = [v9 objectAtIndexedSubscript:v10];
      v18 = [v17 objectAtIndexedSubscript:1];
      unsigned int v19 = [v18 intValue];

      if ((v19 & 0x80000000) != 0)
      {
        v45 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[MOGraph initWithNumVertices:edges:].cold.4();
        }

        v35 = +[NSAssertionHandler currentHandler];
        v36 = v35;
        CFStringRef v37 = @"Invalid parameter not satisfying: edges[i][1].intValue >= 0";
        SEL v38 = a2;
        v39 = self;
        uint64_t v40 = 23;
        goto LABEL_23;
      }
      v20 = [v9 objectAtIndexedSubscript:v10];
      v21 = [v20 objectAtIndexedSubscript:1];
      unint64_t v22 = (int)[v21 intValue];

      if (v22 >= a3)
      {
        v46 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[MOGraph initWithNumVertices:edges:]();
        }

        v35 = +[NSAssertionHandler currentHandler];
        v36 = v35;
        CFStringRef v37 = @"Invalid parameter not satisfying: edges[i][1].intValue < numVertices";
        SEL v38 = a2;
        v39 = self;
        uint64_t v40 = 24;
        goto LABEL_23;
      }
      if ((unint64_t)[v9 count] <= ++v10) {
        goto LABEL_10;
      }
    }
    v43 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[MOGraph initWithNumVertices:edges:].cold.6();
    }

    v35 = +[NSAssertionHandler currentHandler];
    v36 = v35;
    CFStringRef v37 = @"Invalid parameter not satisfying: edges[i][0].intValue >= 0";
    SEL v38 = a2;
    v39 = self;
    uint64_t v40 = 21;
    goto LABEL_23;
  }
LABEL_10:
  v47.receiver = self;
  v47.super_class = (Class)MOGraph;
  v23 = [(MOGraph *)&v47 init];
  v24 = v23;
  if (v23)
  {
    v23->_numVertices = a3;
    objc_storeStrong((id *)&v23->_edges, a4);
    v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    membership = v24->_membership;
    v24->_membership = v25;

    do
    {
      [(NSMutableArray *)v24->_membership addObject:&off_1002F49A0];
      --a3;
    }
    while (a3);
    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sparseAdjacencyMatrix = v24->_sparseAdjacencyMatrix;
    v24->_sparseAdjacencyMatrix = v27;

    if (v24->_numVertices)
    {
      unint64_t v29 = 0;
      do
      {
        id v30 = objc_alloc_init((Class)NSMutableArray);
        v31 = v24->_sparseAdjacencyMatrix;
        v32 = +[NSNumber numberWithInt:v29];
        [(NSMutableDictionary *)v31 setObject:v30 forKeyedSubscript:v32];

        ++v29;
      }
      while (v24->_numVertices > v29);
    }
  }
  self = v24;
  v33 = self;
LABEL_24:

  return v33;
}

- (id)calculateConnectedComponentWithGraphTraversal:(unint64_t)a3
{
  if ([(NSArray *)self->_edges count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(NSArray *)self->_edges objectAtIndexedSubscript:v5];
      v7 = [v6 objectAtIndexedSubscript:0];

      id v8 = [(NSArray *)self->_edges objectAtIndexedSubscript:v5];
      v9 = [v8 objectAtIndexedSubscript:1];

      uint64_t v10 = [(NSMutableDictionary *)self->_sparseAdjacencyMatrix objectForKeyedSubscript:v7];
      [v10 addObject:v9];

      v11 = [(NSMutableDictionary *)self->_sparseAdjacencyMatrix objectForKeyedSubscript:v9];
      [v11 addObject:v7];

      ++v5;
    }
    while ([(NSArray *)self->_edges count] > v5);
  }
  if (self->_numVertices)
  {
    unint64_t v12 = 0;
    uint64_t v13 = 1;
    do
    {
      v14 = [(NSMutableArray *)self->_membership objectAtIndexedSubscript:v12];
      unsigned int v15 = [v14 isEqual:&off_1002F49A0];

      if (v15)
      {
        unint64_t v16 = +[NSNumber numberWithInt:v12];
        v17 = +[NSNumber numberWithInt:v13];
        if (a3 == 1) {
          [(MOGraph *)self bfsStartingFrom:v16 connectedPartIndx:v17];
        }
        else {
          [(MOGraph *)self dfsStartingFrom:v16 connectedPartIndx:v17];
        }

        uint64_t v13 = (v13 + 1);
      }
      ++v12;
    }
    while (self->_numVertices > v12);
  }
  membership = self->_membership;

  return membership;
}

- (void)dfsStartingFrom:(id)a3 connectedPartIndx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_membership, "objectAtIndexedSubscript:", (int)[v6 intValue]);
  unsigned int v9 = [v8 isEqual:&off_1002F49A0];

  if (v9)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_membership, "setObject:atIndexedSubscript:", v7, (int)[v6 intValue]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sparseAdjacencyMatrix, "objectForKeyedSubscript:", v6, 0);
    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [(MOGraph *)self dfsStartingFrom:*(void *)(*((void *)&v15 + 1) + 8 * (void)v14) connectedPartIndx:v7];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)bfsStartingFrom:(id)a3 connectedPartIndx:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_membership, "objectAtIndexedSubscript:", (int)[v6 intValue]);
  unsigned int v8 = [v7 isEqual:&off_1002F49A0];

  if (v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v21 = v6;
    [v9 enqueue:v6];
    while ([v9 count])
    {
      uint64_t v10 = (char *)[v9 count];
      if (v10)
      {
        id v11 = v10;
        for (i = 0; i != v11; ++i)
        {
          uint64_t v13 = [v9 dequeue];
          v14 = -[NSMutableArray objectAtIndexedSubscript:](self->_membership, "objectAtIndexedSubscript:", (int)[v13 intValue]);
          unsigned int v15 = [v14 isEqual:&off_1002F49A0];

          if (v15)
          {
            -[NSMutableArray setObject:atIndexedSubscript:](self->_membership, "setObject:atIndexedSubscript:", v22, (int)[v13 intValue]);
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v16 = [(NSMutableDictionary *)self->_sparseAdjacencyMatrix objectForKeyedSubscript:v13];
            id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v24;
              do
              {
                v20 = 0;
                do
                {
                  if (*(void *)v24 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  [v9 enqueue:*(void *)(*((void *)&v23 + 1) + 8 * (void)v20)];
                  v20 = (char *)v20 + 1;
                }
                while (v18 != v20);
                id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
              }
              while (v18);
            }
          }
        }
      }
    }

    id v6 = v21;
  }
}

- (unint64_t)numVertices
{
  return self->_numVertices;
}

- (void)setNumVertices:(unint64_t)a3
{
  self->_numVertices = a3;
}

- (NSArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
}

- (NSMutableArray)membership
{
  return self->_membership;
}

- (void)setMembership:(id)a3
{
}

- (NSMutableDictionary)sparseAdjacencyMatrix
{
  return self->_sparseAdjacencyMatrix;
}

- (void)setSparseAdjacencyMatrix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseAdjacencyMatrix, 0);
  objc_storeStrong((id *)&self->_membership, 0);

  objc_storeStrong((id *)&self->_edges, 0);
}

- (void)initWithNumVertices:edges:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: numVertices > 0", v2, v3, v4, v5, v6);
}

- (void)initWithNumVertices:edges:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges", v2, v3, v4, v5, v6);
}

- (void)initWithNumVertices:edges:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges[i][1].intValue < numVertices", v2, v3, v4, v5, v6);
}

- (void)initWithNumVertices:edges:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges[i][1].intValue >= 0", v2, v3, v4, v5, v6);
}

- (void)initWithNumVertices:edges:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges[i][0].intValue < numVertices", v2, v3, v4, v5, v6);
}

- (void)initWithNumVertices:edges:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: edges[i][0].intValue >= 0", v2, v3, v4, v5, v6);
}

@end