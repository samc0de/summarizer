# Text Summarization using deep neural networks
It uses Recurrent Neural Network (LSTM and GRU units) for developing Seq2Seq Encoder Decoded model (with and without attention mechanism) for summarization of amazon food reviews into abstractive tips (public domain dataset).

## Contents
- [DataSet](#dataset)
- [Documentation](#documentation)
- [References](#references)


## DataSet
- **DataSet Information** - This dataset consists of reviews of fine foods from amazon. The data span a period of more than 10 years, including all ~500,000 reviews up to October 2012. Reviews include product and user information, ratings, and a plaintext review.

The dataset can be downloaded from [here](https://snap.stanford.edu/data/web-FineFoods.html)

A sample dataset example looks like this -
```
product/productId: B001E4KFG0
review/userId: A3SGXH7AUHU8GW
review/profileName: delmartian
review/helpfulness: 1/1
review/score: 5.0
review/time: 1303862400
review/summary: Good Quality Dog Food
review/text: I have bought several of the Vitality canned dog food products and have
found them all to be of good quality. The product looks more like a stew than a
processed meat and it smells better. My Labrador is finicky and she appreciates this
product better than most.
```

The input review has key `review/text` and the target summary that we wish to generate has key `review/summary`. For the purpose of this project, all other fields are ignored and the following two fields are extracted by the extracter script provided.



## Documentation

```
docs/build/html/index.html
```

The documentation was created automatically, and thus can be error prone. Please report any in the issue table. Some methods have missing documentation. This is not an error, but probably of lesser priority. It will be added soon.

To access documentation, just open index.html located at

on your favorite browser. You can open them locally for now. I will try hosting them on Github pages once i get time. 


## References
1) J. McAuley and J. Leskovec. From amateurs to connoisseurs: modeling the evolution of user expertise through online reviews. WWW, 2013.

2) Sutskever, Ilya, Oriol Vinyals, and Quoc V. Le. "Sequence to sequence learning with neural networks." Advances in neural information processing systems. 2014.

3) Cho, Kyunghyun, et al. "Learning phrase representations using RNN encoder-decoder for statistical machine translation." arXiv preprint arXiv:1406.1078 (2014).
