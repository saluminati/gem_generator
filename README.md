# gem_generator
Ruby gem generator using thor


I have been writing ruby gems for sometime now and always wish that there could be a command that can generate the gem structure/boilerplate and the things I love pre-configured for me.

# Getting started

Run the following commands on your terminal

```console

gem install thor

git clone https://github.com/saluminati/gem_generator.git

cd gem_generator

thor gem_generator your_gem_name

```

# Using the rspec and rubocop options
If you want to have rspec suit and rubocop pre-installed use the following command line options

```console
thor gem_generator your_gem_name --use_rspec_suit=true --use_rubocop=true
```

![](https://s3-ap-southeast-2.amazonaws.com/sal-blog/wp-content/uploads/2022/03/image-2.png)
